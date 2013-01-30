require 'open-uri'

class SummaryMailer < ActionMailer::Base
  layout 'mailer'
  default from: "FeatBeat <featbat@adamloving.com>" # TODO config value

  def daily_reminder
    mail(
      :to => 'adam@adamloving.com', # TODO config value
      :subject => "How was your day?"
    )
  end

end
