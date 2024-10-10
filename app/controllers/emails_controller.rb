class EmailsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def send_email
    to_email = params[:email]
    content = params[:content]

    SendEmailJob.perform_later(to_email, content)

    render json: {status: "Email is being sent in the background!"}, status: :ok
  end

  def send_two_types_email
    to_email = params[:email]
    content = params[:content]

    CriticalEmailJob.perform_later(to_email, "Critical: #{content}")
    DefaultEmailJob.perform_later(to_email, "Default: #{content}")

    render json: {status: "Both critical and default emails are being sent in the background!"}, # rubocop:disable Layout/LineLength
           status: :ok
  end

  def schedule_email
    to_email = params[:email]
    content = params[:content]

    ScheduledEmailJob.perform_in(1.minute, to_email, content)

    render json: {status: "Scheduled email to be sent in 1 minute!"},
           status: :ok
  end
end
