package com.bihell.dice.model.blog;

import com.baomidou.mybatisplus.annotation.TableId;
import com.bihell.dice.model.BaseEntity;
import com.bihell.dice.enums.PostStatusEnum;
import com.bihell.dice.utils.DiceConsts;
import lombok.*;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * 文章 Model
 *
 * @author bihell
 * @since 2017/7/8 9:29
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
public class Article extends BaseEntity<Article> {

    @TableId
    private Integer id;
    @Size(max = 255,message = "文章标题字数不能超过255")
    @NotNull(message = "文章标题不能为空")
    private String title;
    @Size(max = 200000,message = "文章内容字数不能超过200000")
    @NotNull(message = "文章内容不能为空")
    private String content;
    private Integer hits;
    private String tags;
    private String category;
    private Integer priority;
    private PostStatusEnum status;
    private String type;
    private Boolean allowComment;
    private Integer commentCount;
}
