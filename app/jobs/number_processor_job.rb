class NumberProcessorJob
  include Sidekiq::IterableJob

  # This method builds an Enumerator,
  # starting from the position saved in the cursor
  def build_enumerator *_args, cursor:
    range = (1..20).to_a

    array_enumerator(range, cursor:)
  end

  # This method processes each item in the list
  def each_iteration(number, *_args)
    sleep 1

    if rand < 0.3
      raise Sidekiq::Job::Interrupted, "Simulating sudden interruption!"
    end

    logger.info "Processing number: #{number}"
  end

  # Log when the job is complete
  def on_complete
    logger.info "All numbers processed successfully!"
  end

  # Log when the job first starts
  def on_start
    logger.info "Job has started for the first time."
  end

  # Log when the job resumes after an interruption
  def on_resume
    logger.info "Job has resumed after being interrupted."
  end

  # Log when the job stops, either due to completion or interruption
  def on_stop
    logger.info "Job is stopping, either due to completion or interruption."
  end
end
