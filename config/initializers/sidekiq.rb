module Sidekiq
  class Logger < ::Logger
    module Formatters
      class CustomJson < Base
        def call(severity, time, program_name, message)
          hash = {
            '@timestamp': time.utc.iso8601(3),
            pid: ::Process.pid,
            tid: tid,
            level: severity,
            message: message,
            origin: "sidekiq",
          }
          c = ctx
          hash["ctx"] = c unless c.empty?
          Sidekiq.dump_json(hash) << "\n"
        end
      end
    end
  end
end

Sidekiq.configure_server do |config|
  config.redis = { url: ENV.fetch("REDIS_URL", "redis://redis:6379/0") }

  config.logger = Logger.new(STDOUT)
  config.logger.formatter = Sidekiq::Logger::Formatters::CustomJson.new
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV.fetch("REDIS_URL", "redis://redis:6379/0") }
end
