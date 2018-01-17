FROM ruby:2.5.0
ENV LANG C.UTF-8
# for MySQL
RUN apt-get update -qq && apt-get install -y build-essential mysql-client nodejs
RUN apt-get install -y cron
RUN echo '*/5 * * * * root /path/to/your_command' >> /etc/crontab
CMD ["cron", "-f"]

RUN gem install bundler

WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

ENV APP_HOME /app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
ADD . $APP_HOME

EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]