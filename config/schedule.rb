every 1.day, at: "12:00 am" do
  rake "my:rake:task"
  command "echo \"Running rake task at 12:00 AM\" >> /app/log/cron_test.log"
end

every 3.hours do
  runner "MyModel.some_method"
  command "echo \"Running MyModel.some_method every 3 hours\" >> /app/log/cron_test.log"
end

every 1.minute do
  command 'for i in {1..6}; do echo "Cron job is running at: $(date)" >> /app/log/cron_test.log; sleep 10; done'
end
