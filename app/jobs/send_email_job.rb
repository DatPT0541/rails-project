class SendEmailJob < ApplicationJob
  queue_as :default

  def perform to_email, content
    UserMailer.send_custom_email(to_email, content).deliver_now
  end
end
