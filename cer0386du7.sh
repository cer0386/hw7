#!/bin/bash
REPO=$1
DIR=$2
USER_ID=$(id -u)
if [ -z $REPO ]
then
        echo "Missing REPO parameter"
        exit 1
elif [ -z $DIR ]
then
        echo "Missing DIR parameter."
        exit 1
fi

git clone "$REPO" /tmp/cer0386repo/
docker run -it --rm -u $USER_ID --name cer0386du7 -v /tmp/cer0386repo:/usr/src/repo -w /usr/src/repo koz01/maven:3.6.3-jdk-8-javafx mvn clean install
mkdir -p $DIR
cp /tmp/cer0386repo/target/*.jar $DIR