FROM ruby:2.5.1
RUN gem install bundler

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs bc && \
    rm -rf /var/lib/apt/lists/*

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install yarn && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /todo_rails_zw
WORKDIR /todo_rails_zw
ENV BUNDLE_PATH /todo_rails_zw/.gems
ENV GEM_HOME /todo_rails_zw/.gems 
