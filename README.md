## 特别感谢

- [Dice-Blog](https://github.com/bihell/Dice)

## 一、简介

* 基于`node` `vue` `nuxt` `java` `spring-boot`  开发的个人博客

## 二、项目结构

```
Dice
├── dice-admin        --  后台管理前端，基于vue-vben-admin项目开发。
├── dice-front        --  博客SEO前端，基于vue-next项目开发
└── dice-server       --  后端服务，Spring Boot全家桶
    ├── admin         --  SpringBootAdmin Server模块
    ├── blog          --  博客模块
    ├── bootstrap     --  启动模块
    ├── config        --  配置模块
    ├── distribution  --  打包模块
    ├── framework     --  框架核心模块
    ├── generator     --  代码生成模块
    ├── nav           --  导航模块
    └── system        --  系统模块
```

## 二、项目依赖

`docker`、`docker-componse`、`nodejs`、`npm`、`yarn`、`Java8`、`Redis`、`MySQL`等。

## 三、前端 dice-front

```Bash
npm install
npm run dev
```

## 四、管理端 dice-admin

```Bash
yarn install
yarn dev
```
