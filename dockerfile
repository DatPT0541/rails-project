FROM ruby:3.2.2

# Cài đặt các gói cần thiết
RUN apt-get update -qq && apt-get install -y build-essential libmariadb-dev nodejs

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

# Mở cổng 3000
EXPOSE 3000

# Lệnh để khởi động server
CMD ["rails", "server", "-b", "0.0.0.0"]
