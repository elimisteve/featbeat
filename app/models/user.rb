class User
  # called by scheduled rake task
  def self.send_reminders
    SummaryMailer.daily_reminder.deliver
  end
end