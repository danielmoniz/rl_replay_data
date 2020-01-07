source env/bin/activate # *nix
source env/Scripts/activate # Windows

pip install -r requirements.txt

jupyter serverextension enable --py jupyter_http_over_ws
