# Dockerfile
FROM bsctemu/wp3_nlp_pipelines
USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -qq ; apt-get upgrade ; \
    apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update -qq ; apt-get install -y git vim python3-pip python3-venv
ARG DEBIAN_FRONTEND=noninteractive

WORKDIR ${HOME}
RUN git clone --single-branch --branch dockerized https://github.com/inab/vre_template_tool.git
WORKDIR /home/wp3_nlp_pipelines/vre_template_tool

RUN ls
RUN pip3 install --upgrade wheel
RUN pip3 install -r requirements.txt
RUN pip3 install --upgrade pip
RUN pwd

RUN usermod -a -G staff www-data

COPY tests /home/wp3_nlp_pipelines/vre_template_tool/tests
COPY VRE_Tool.py /home/wp3_nlp_pipelines/vre_template_tool/tool
RUN chmod -R 777 /home/wp3_nlp_pipelines/vre_template_tool
RUN chmod -R a+rwx /home/wp3_nlp_pipelines/vre_template_tool

WORKDIR ${HOME}
RUN useradd -m application
USER application
