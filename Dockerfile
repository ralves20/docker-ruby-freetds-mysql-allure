FROM ruby:2.4.4



RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update
RUN apt-get install -y nano
RUN apt-get install -y build-essential module-assistant libssl-dev libreadline-dev zlib1g-dev
RUN apt-get install -y unixodbc unixodbc-dev freetds-dev freetds-bin tdsodbc libc6-dev libtool-bin
RUN apt-get install -y default-libmysqlclient-dev
RUN apt-get install -y unzip software-properties-common openjdk-8-jdk

# Install tiny_tds
RUN wget ftp://ftp.freetds.org/pub/freetds/stable/freetds-1.1.4.tar.gz && \
  tar -xzf freetds-1.1.4.tar.gz && \
  cd freetds-1.1.4 && \
  ./configure --prefix=/usr/local && \
  make && make install && make clean



RUN apt-get install -y nodejs yarn
RUN yarn global add allure-commandline


ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

WORKDIR /usr/src/app