class DefaultEmailJob < ApplicationJob
  queue_as :default

  def perform email, message
    Rails.logger.info "DefaultEmailJob started at #{Time.zone.now}"
    UserMailer.with(email:, message:).send_default_email.deliver_now
  end
end
