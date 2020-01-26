FROM codercom/code-server:v2

ARG PASSWORD
ENV PASSWORD=$PASSWORD

RUN mkdir -p /home/coder/.local/share/code-server/
RUN mkdir -p /home/coder/project

# Give owner rights to the current user
RUN chown -Rh $user:$user /home/coder/.local/share/code-server/
RUN chown -Rh $user:$user /home/coder/project

USER $user

COPY ./requirements.txt /home/coder/project/

# Python3.6
RUN apt-get update && \
  apt-get install -y apt-utils python3.6 python3.6-dev python3.6-distutils wget curl unzip apt-utils vim git libfontconfig && \
  curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
  python3.6 get-pip.py && \
  pip install --upgrade pip && \
  pip install -r requirements.txt && \
  echo "alias python='python3.6'" >> ~/.bashrc
