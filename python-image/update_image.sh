#!/bin/bash

username=$1
version=$2

if [[ -z "${username}" ]]; then
	echo "username required"
	exit -1
fi
if [[ -z "${version}" ]]; then
	echo "version required"
	exit -1
fi

registry=registry.cn-qingdao.aliyuncs.com
repo=${registry}/zrwbase/baseimage-repo
tag=baseimage-repo:${version}

docker build -f Dockerfile-jieba -t ${tag} . || exit -1
ImageId=$(docker images -q ${tag})

echo "build ${tag} success, image id ${ImageId}"

docker login --username=${username} ${registry}
docker tag ${ImageId} ${repo}:${version}
docker push ${repo}:${version}