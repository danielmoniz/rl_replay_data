source env/bin/activate # *nix
source env/Scripts/activate # Windows

pip install -r requirements-gpu.txt
pip install --upgrade setuptools # needed in some cases for a working Tensorflow

jupyter serverextension enable --py jupyter_http_over_ws

sh ./install_cuda.sh
