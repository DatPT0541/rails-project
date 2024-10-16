class ScheduledEmailJob
  include Sidekiq::Job
  sidekiq_options retry: 5, backtrace: true

  def perform to_email, content
    UserMailer.send_custom_email(to_email, content).deliver_now
  end
end
