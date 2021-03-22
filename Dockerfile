# 设置基础镜像
#FROM nginx
# 定义作者
#MAINTAINER cats1
# 将dist文件中的内容复制到 /work/test/ 这个目录下面
#COPY dist/  /work/test/
# -t 是给镜像取名。
# 最后有一个点 “.”，表示使用当前路径下的 dockerfile 文件，也可以指定使用其它路径的。
#docker build -t vue3 .
# -p ：配置端口映射，格式是外部访问端口：容器内端口
# -d ：后台运行  
# --name : 给容器取名
# 最后有 2 个 vue3,前面一个是给容器取的名字，后面一个是使用的镜像的名字
#docker run -p 3000:80 -d --name vue3 vue3

# FROM httpd:latest
# COPY ./dist/ /usr/local/apache2/htdocs/
# WORKDIR /usr/local/apache2/htdocs/
# EXPOSE 80

# 设置基础镜像
FROM nginx
# 定义作者
MAINTAINER cats1
# 将dist文件中的内容复制到 /work/test/ 这个目录下面
COPY dist/  /usr/share/nginx/html