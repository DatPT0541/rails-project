class MyFirstJob < ApplicationJob
  queue_as :default

  def perform name, age
    # Do something later
    Rails.logger.debug "I am #{name}, running my first job at #{age}"
  end
end
