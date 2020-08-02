#!/bin/bash

error() {
    if [ $? != 0 ]; then
        echo "Error!"
        exit 122
    fi
}

build() {
    echo "=> Building ${1}"
    docker build -t ${1} .
    echo "=> Built ${1}"
}

tag() {
    echo "=> Tagging ${1}"
    docker tag ${1} "eduardoelias"/${1}
    echo "=> Tagged ${1}"
}

push() {
    echo "=> Pushing ${1}"
    docker push "eduardoelias"/${1}
    echo "=> Pushed ${1}"
}

build ${1}
error
tag ${1}
error
push ${1}
error
echo

exit 0