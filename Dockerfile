FROM redis:4.0.1
RUN apt -y update \
    && apt-get -y install wget \
    && apt-get -y install curl \
    && apt-get -y install gnupg2
RUN wget http://download.redis.io/releases/redis-4.0.1.tar.gz \
    && tar xvf redis-4.0.1.tar.gz \
    && rm -rf redis-4.0.1.tar.gz \
    && cp redis-4.0.1/src/redis-trib.rb /usr/local/bin/ \
    && rm -rf redis-4.0.1
RUN curl -sSL https://rvm.io/mpapis.asc | gpg2 --import - \
    && curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -\
    && curl -L get.rvm.io | bash -s stable
RUN /bin/bash -c "source /usr/local/rvm/scripts/rvm \
    && rvm install 2.3.3 \
    && rvm use 2.3.3 \
    && gem install redis"
