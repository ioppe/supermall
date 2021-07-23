FROM redis:4.0.1
RUN apt -y update
RUN apt-get -y install curl
RUN apt-get -y install gnupg2
RUN curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
RUN curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -
RUN curl -L get.rvm.io | bash -s stable
RUN /usr/local/rvm/scripts/rvm install 2.3.3
RUN /usr/local/rvm/scripts/rvm use 2.3.3
RUN gem install redis
