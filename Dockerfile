FROM nikolaik/python-nodejs:python3.9-nodejs18
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN apt install curl \
&&curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash \
&& source ~/.bashrc \
&& nvm list-remote \
&& nvm install v16.1.0
COPY . /app/
WORKDIR /app/
RUN pip3 install --no-cache-dir --upgrade --requirement requirements.txt
CMD bash start
