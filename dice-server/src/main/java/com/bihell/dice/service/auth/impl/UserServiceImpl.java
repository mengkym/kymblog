package com.bihell.dice.service.auth.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.bihell.dice.exception.TipException;
import com.bihell.dice.mapper.auth.AuthRelRoleUserMapper;
import com.bihell.dice.mapper.auth.UserMapper;
import com.bihell.dice.model.auth.AuthRelRoleUser;
import com.bihell.dice.model.auth.User;
import com.bihell.dice.model.params.LoginParam;
import com.bihell.dice.model.params.QueryParam;
import com.bihell.dice.security.AuthToken;
import com.bihell.dice.security.SecurityUtil;
import com.bihell.dice.security.authentication.Authentication;
import com.bihell.dice.security.context.SecurityContextHolder;
import com.bihell.dice.service.auth.AuthRelRoleUserService;
import com.bihell.dice.service.system.RedisService;
import com.bihell.dice.service.auth.UserService;
import com.bihell.dice.utils.DiceUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

import static com.bihell.dice.utils.DiceConsts.ACCESS_TOKEN_EXPIRED_SECONDS;
import static com.bihell.dice.utils.DiceConsts.REFRESH_TOKEN_EXPIRED_DAYS;

/**
 * User Service 层实现类
 *
 * @author bihell
 * @since 2017/7/12 21:24
 */
@Service("usersService")
@Slf4j
@Transactional(rollbackFor = Throwable.class)
@RequiredArgsConstructor(onConstructor_ = @Autowired)
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    private final RedisService redisService;
    private final UserMapper userMapper;
    private final AuthRelRoleUserMapper authRelRoleUserMapper;
    private final AuthRelRoleUserService authRelRoleUserService;

    /**
     * Authenticates.
     *
     * @param loginParam login param must not be null
     * @return authentication token
     */
    @NotNull
    @Override
    public AuthToken authenticate(@NotNull LoginParam loginParam) {
        Assert.notNull(loginParam, "Login param must not be null");

        String username = loginParam.getUsername();

        User user = new User().selectOne(new QueryWrapper<User>().lambda().eq(User::getUsername, username).or().eq(User::getEmail, username));
        if (null == user) {
            throw new TipException("用户名或者密码错误");
        }
        String md5 = DiceUtil.getMd5(loginParam.getPassword());
        if (!md5.equals(user.getPasswordMd5())) {
            throw new TipException("用户名或者密码错误");
        }

        // todo 这里清空 Token 之后还能获得用户信，后续另外处理
//        if (SecurityContextHolder.getContext().isAuthenticated()) {
//            // If the user has been logged in
//            throw new TipException("您已登录，请不要重复登录");
//        }

        // Log it then login successful
        log.info("用户登录: {}", user.getUsername());
        user.setLogged(LocalDateTime.now());
        user.updateById();

        // Generate new token
        return buildAuthToken(user);
    }

    /**
     * Clears authentication.
     */
    @Override
    public void clearToken() {
        // Check if the current is logging in
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication == null) {
            throw new TipException("您尚未登录，因此无法注销");
        }

        // Get current user
        User user = authentication.getDetail().getUser();

        String accessToken = (String) redisService.get(SecurityUtil.buildAccessTokenKey(user));
        if (accessToken != null) {
            redisService.remove(SecurityUtil.buildTokenAccessKey(accessToken));
            redisService.remove(SecurityUtil.buildAccessTokenKey(user));
        }

        String refreshToken = (String) redisService.get(SecurityUtil.buildRefreshTokenKey(user));
        if (accessToken != null) {
            redisService.remove(SecurityUtil.buildTokenRefreshKey(refreshToken));
            redisService.remove(SecurityUtil.buildRefreshTokenKey(user));
        }

        log.info("You have been logged out, looking forward to your next visit!");
    }

    /**
     * 获取用户列表
     *
     * @return
     */
    @Override
    public IPage<User> getUserList(QueryParam queryParam) {
        Page<User> page = new Page<>(queryParam.getPageNum(), queryParam.getPageSize());
        LambdaQueryWrapper<User> wrapper = new QueryWrapper<User>().lambda()
                .select(User.class, info -> !"passwordMd5".equals(info.getProperty()))
                .like(User::getUsername, queryParam.getCriteria())
                .orderByDesc(User::getCreated);

        return userMapper.selectPage(page, wrapper);
    }

    @Override
    public void assignRole(User user) {
        user.deleteById();
        if (!CollectionUtils.isEmpty(user.getRoleIds())) {
            List<AuthRelRoleUser> authRelRoleUserList = user.getRoleIds().stream()
                    .filter(Objects::nonNull)
                    .map(i-> new AuthRelRoleUser().setUserId(user.getId()).setRoleId(i))
                    .collect(Collectors.toList());
            authRelRoleUserService.saveBatch(authRelRoleUserList);
        }
    }

    @Override
    public void addUser(User user) {
        if (user.selectCount(new QueryWrapper<User>().lambda().eq(User::getUsername, user.getUsername()).or().eq(User::getEmail, user.getEmail())) < 1) {
            user.setPasswordMd5(DiceUtil.getMd5(user.getPasswordMd5()));
            user.insert();
        } else {
            throw new TipException("用户名或邮箱已存在");
        }
    }

    @Override
    public void updateUser(User user) {
        if (user.selectCount(new QueryWrapper<User>()
                .ne("id", user.getId())
                .and(field -> {
                    field.eq("username", user.getUsername()).or().eq("email", user.getEmail());
                })) < 1) {
            user.setPasswordMd5(DiceUtil.getMd5(user.getPasswordMd5()));
            user.updateById();
        } else {
            throw new TipException("用户名或邮箱已存在");
        }
    }

    @Override
    public User getUserSingle(Integer id) {
        LambdaQueryWrapper<User> wrapper = new QueryWrapper<User>().lambda()
                .select(User.class, info -> !"passwordMd5".equals(info.getProperty()))
                .eq(User::getId, id);
        return userMapper.selectOne(wrapper);
    }

    @Override
    public boolean resetPassword(String username, String oldPassword, String newPassword) {
        User user = new User().selectOne(new QueryWrapper<User>().lambda().eq(User::getUsername, username));
        if (null == user) {
            throw new TipException("该用户名不存在");
        }

        if (!user.getPasswordMd5().equals(DiceUtil.getMd5(oldPassword))) {
            throw new TipException("原密码错误");
        }

        user.setPasswordMd5(DiceUtil.getMd5(newPassword));
        return user.updateById();
    }

    /**
     * 修改用户信息
     *
     * @param oldUsername 原用户名
     * @param newUsername 新用户名
     * @param email       邮箱
     * @return boolean
     */
    @Override
    public boolean resetUser(String oldUsername, String newUsername, String email) {
        User user = new User().selectOne(new QueryWrapper<User>().lambda().eq(User::getUsername, oldUsername));
        if (null == user) {
            throw new TipException("该用户名不存在");
        }

        user.setUsername(newUsername);
        user.setEmail(email);

        return user.updateById();
    }

    /**
     * Builds authentication token.
     *
     * @param user user info must not be null
     * @return authentication token
     */
    @NonNull
    private AuthToken buildAuthToken(@NonNull User user) {
        Assert.notNull(user, "User must not be null");

        // Generate new token
        AuthToken token = new AuthToken();

        token.setAccessToken(DiceUtil.randomUUIDWithoutDash());
        token.setExpiredIn(ACCESS_TOKEN_EXPIRED_SECONDS);
        token.setRefreshToken(DiceUtil.randomUUIDWithoutDash());

        // Cache those tokens, just for clearing
        redisService.set(SecurityUtil.buildAccessTokenKey(user), token.getAccessToken(), REFRESH_TOKEN_EXPIRED_DAYS, TimeUnit.DAYS);
        redisService.set(SecurityUtil.buildRefreshTokenKey(user), token.getRefreshToken(), REFRESH_TOKEN_EXPIRED_DAYS, TimeUnit.DAYS);

        // Cache those tokens with user id
        redisService.set(SecurityUtil.buildTokenAccessKey(token.getAccessToken()), user.getId(), ACCESS_TOKEN_EXPIRED_SECONDS, TimeUnit.SECONDS);
        redisService.set(SecurityUtil.buildTokenRefreshKey(token.getRefreshToken()), user.getId(), REFRESH_TOKEN_EXPIRED_DAYS, TimeUnit.DAYS);

        return token;
    }
}
