FROM tensorflow/tensorflow:2.0.1-gpu-py3-jupyter
# ENV VIRTUAL_ENV=./env
# ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN apt-get install -y git

COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
