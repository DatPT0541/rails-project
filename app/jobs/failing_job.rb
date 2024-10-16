class FailingJob < ApplicationJob
  queue_as :default
  sidekiq_options retry: 5, backtrace: true

  def perform(*_args)
    raise "Something went wrong!"
  end

  sidekiq_retries_exhausted do |job, ex|
    Sidekiq.logger.warn "Job #{job['class']} with arguments #{job['args']} has failed: #{ex.message}" # rubocop:disable Layout/LineLength
  end
end
