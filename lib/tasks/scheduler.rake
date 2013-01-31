desc "This task is called by the Heroku scheduler add-on"

# Send email to participants where clicked_invite == true and not received 'welcome'
# also notifies the organizer.
task :send_summary => :environment do
  completed_count, pending_count = Import.complete
  puts "Completed #{completed_count} of #{pending_count} pending exports (#{Import.count} total)"
end