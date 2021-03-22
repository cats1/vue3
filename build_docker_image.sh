#!/bin/bash
# 切换到主目录
cd ..
# 清理之前的文件
rm -rf /tmp/share/
rm -rf ./dist/
rm -rf ./node_modules
# 如果没有基础镜像，构建一个
if [[ "$(docker images -q vue3:base 2> /dev/null)" == "" ]]; then
    echo "build base image"
    docker build -t vue3:base -f ./docker/Dockerfile.base .
fi
# 使用 docker 构建 vue dist
echo "build building image"
docker build -t vue3:build -f ./docker/Dockerfile.make .
docker run -it --name build -v /tmp/share/:/tmp/share/ vue3:build
# 将构建结果拷贝出来
cp -r /tmp/share/dist ./dist
# 使用构建结果打包成目标镜像
echo "build dist image"
docker rmi vue-cms:latest
docker build -t vue-cms:latest -f ./docker/Dockerfile . 
# 运行镜像
docker stop vue
docker rm vue
docker run -it -d --name vue -p 8080:80 vue-cms:latest
open http://localhost:8080

# 清理中间镜像
docker rm build
docker rmi vue-cms:build