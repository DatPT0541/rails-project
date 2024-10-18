class ExampleLoggingJob < ApplicationJob
  queue_as :default

  def perform(*args)
    logger.info "Starting the job with arguments: #{args.inspect}"

    sleep 2
    logger.info "Job finished successfully!"
  end
end
