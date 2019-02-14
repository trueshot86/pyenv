#!/bin/bash

OS=""

get_os_distribution(){
    if [ -e /etc/lsb-release ] ; then
        OS="ubuntu"
    elif [ -e /etc/redhat-release ] ; then
        OS="centos"
    else
        echo "this tool can use at Ubuntu or CentOS"
        exit 1
    fi
}

require(){
    if [ ${OS} == "ubuntu" ] ; then
        apt update
        apt install git -y
        apt install build-essential libncursesw5-dev libgdbm-dev libc6-dev zlib1g-dev libsqlite3-dev tk-dev libssl-dev openssl libbz2-dev libreadline-dev -y
    elif [ ${OS} == "centos" ] ; then
        yum install git -y
        yum install zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel gcc libffi-devel -y
    fi
}

get_source(){
    git clone https://github.com/yyuu/pyenv.git ~/.pyenv
}

set_up(){
    if [ ${OS} == "ubuntu" ] ; then
        echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.profile
        echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile
        echo 'eval "$(pyenv init -)"' >> ~/.profile
        source ~/.profile
        echo "Dont't forget to do source ~/.profile"
    elif [ ${OS} == "centos" ] ; then
        echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
        echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
        echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
        source ~/.bash_profile
        echo "Dont't forget to do source ~/.bash_profile"
    fi
}

main(){
    get_os_distribution
    require
    get_source
    set_up
}

main
