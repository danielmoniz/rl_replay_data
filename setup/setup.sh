# first time only: ---
# pyenv install 3.6.8
# pip install virtualenv
# virtualenv ../env

source ../env/bin/activate # *nix
# source ../env/Scripts/activate # git bash on Windows

pip install -r requirements.txt
pip install --upgrade setuptools # needed in some cases for a working Tensorflow

jupyter serverextension enable --py jupyter_http_over_ws
