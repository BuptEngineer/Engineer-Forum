## 简单描述
简装论坛

## 功能
* 发布博客

## 技术依赖
* bootstrap
* jQuery
* spring
* spring MVC
* Mybatis
* MySQL

## 使用
* 使用eclipse/idea，导入maven工程，tomcat运行
* 使用docker环境运行，具体如下
```bash
mkdir ~/gitbranch && cd ~/gitbranch
git clone https://github.com/BuptEngineer/Engineer-Forum.git
docker pull tickstate/ubuntu:14.0
docker run -it -p 8081:8081 -p 3306:3306 -v $(pwd)/Engineer-Forum:/home/gitbranch/Engineer-Forum tickstate/ubuntu:14.0
#进入容器后,开启服务
bash ~/prepare.sh
#部署项目
bash ~/deploy.sh
#在浏览器中输入主机ip:8081即可
```

## 效果
![](pic/mainPage.gif)

