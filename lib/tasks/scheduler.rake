desc "This task is called by the Heroku scheduler add-on"

# Send email to participants where clicked_invite == true and not received 'welcome'
# also notifies the organizer.
task :send_summary => :environment do
  SummaryMailer.daily_reminder.deliver
end