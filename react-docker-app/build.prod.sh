#!/bin/bash

# svn update

NUM=0.1

VERSION=$(<version.txt)

TAG=`echo $VERSION $NUM | awk '{print $1 + $2}'`

echo "build image"

docker build -f Dockerfile.prod -t qaysdocker/react-docker-app:nginx_$TAG .

#echo "Tag image"

#call docker tag react-docker-app:$TAG  qaysdocker/react-docker-app:nginx_$TAG

echo "Push image"

docker push qaysdocker/react-docker-app:nginx_$TAG

echo $TAG

echo $TAG > version.txt

# svn commit -m "version $TAG"

# echo "Run image"

# docker run -d --name reactui -p 80:80 react-ui