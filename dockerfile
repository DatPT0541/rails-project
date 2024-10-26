FROM ruby:3.2.2

# Cài đặt các gói cần thiết, bao gồm cron
RUN apt-get update -qq && apt-get install -y build-essential libmariadb-dev nodejs cron

# Thiết lập thư mục làm việc
WORKDIR /app

# Sao chép Gemfile và Gemfile.lock vào container
COPY Gemfile Gemfile.lock /app/

# Cài đặt các gems từ Gemfile
RUN gem install bundler && bundle install

# Sao chép mã nguồn của ứng dụng vào container
COPY . /app

# Tiền xử lý assets
RUN bundle exec rake assets:precompile

# Cài đặt file cron job
RUN bundle exec whenever --update-crontab

# Mở cổng 3000
EXPOSE 3000

# Lệnh để khởi động server
CMD ["bash", "-c", "cron && rm -f tmp/pids/server.pid && bundle exec rails s -b '0.0.0.0'"]
