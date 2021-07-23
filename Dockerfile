FROM redis:4.0.1
RUN apt -y update
RUN apt-get -y install curl
RUN apt-get -y install gnupg
RUN curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
RUN curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -
RUN curl -L get.rvm.io | bash -s stable
RUN source /usr/local/rvm/scripts/rvm
RUN echo "ruby_url=https://cache.ruby-china.com/pub/ruby" > /usr/local/rvm/user/db
RUN rvm install 2.3.3
RUN rvm use 2.3.3
RUN gem install redis
