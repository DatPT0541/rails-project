require "sidekiq/web"

Rails.application.routes.draw do
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == ENV["SIDEKIQ_USERNAME"] && password == ENV["SIDEKIQ_PASSWORD"]
  end
  mount Sidekiq::Web => "/sidekiq"
  post "send_email", to: "emails#send_email"
  post "send_two_types_email", to: "emails#send_two_types_email"
  post "schedule_email", to: "emails#schedule_email"
  post "trigger_failing_job", to: "jobs#trigger_failing_job"
  post "logging_job", to: "jobs#logging_job"
  post "process_numbers", to: "jobs#process_numbers"
end
