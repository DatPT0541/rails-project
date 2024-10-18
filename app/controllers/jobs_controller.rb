class JobsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def trigger_failing_job
    FailingJob.perform_later
    render json: {status: "Failing job has been enqueued!"}
  end

  def logging_job
    ExampleLoggingJob.perform_later("Argument 1", "Argument 2")
    ExampleLoggingJob.perform_later("Argument 3")
    ExampleLoggingJob.perform_later("Argument 4")
    ExampleLoggingJob.perform_later("Argument 5")
    ExampleLoggingJob.perform_later("Argument 6", "Argument 7",
                                    "Argument 8")

    render json: {status: "ExampleLoggingJob ok!"},
           status: :ok
  end

  def process_numbers
    NumberProcessorJob.perform_async

    render json: {status: "NumberProcessorJob has been enqueued!"}, status: :ok
  end
end
