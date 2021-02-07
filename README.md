# pyenv

* [what is this?](#what-is-this)
* [install](#install)
* [command](#command)

## What is this?
this is python version management tool.



## install
```
$ chmod +x install.sh
$ ./install.sh
```

## command
- pyenv install -l
  - show list of python version you can install.

- pyenv install xxx(3.7.0)
  - install python.

- pyenv global xxx(3.7.0)
  - global mode.

- pyenv local xxx(3.7.0)
  - local mode.

- pyenv versions
  - show list of installed python version.



## tips for tkinter.
# 一旦ネイティブ環境に切り替える
pyenv global system
 
# 対象の環境を削除する
pyenv uninstall 3.X.X
 
# 必要なものをインストールする
sudo apt-get install python3-tk
sudo apt install tk-dev
 
# 再度環境をインストールする
pyenv install 3.X.X
pyenv global 3.X.X
