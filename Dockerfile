FROM jupyter/scipy-notebook:latest

COPY requirements.txt /tmp/
RUN pip install --requirement /tmp/requirements.txt

WORKDIR /home/jovyan/work