class CriticalEmailJob < ApplicationJob
  queue_as :critical

  def perform email, message
    Rails.logger.info "CriticalEmailJob started at #{Time.zone.now}"
    UserMailer.with(email:, message:).send_critical_email.deliver_now
  end
end
