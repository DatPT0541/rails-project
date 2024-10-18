class UserMailer < ApplicationMailer
  def send_custom_email to_email, content
    @content = content
    mail(to: to_email, subject: "Custom Email Subject")
  end

  def send_critical_email
    @message = params[:message]
    mail(to: params[:email], subject: "Critical Email")
  end

  def send_default_email
    @message = params[:message]
    mail(to: params[:email], subject: "Default Email")
  end
end
