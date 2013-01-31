require 'open-uri'

class SummaryMailer < ActionMailer::Base
  include ApplicationHelper

  layout 'mailer'
  default from: ENV['DEFAULT_FROM_EMAIL']

  def daily_reminder
    @base_url = base_url
    mail(
      :to => ENV['USER_EMAIL'], 
      :subject => "How was your day?"
    )
  end

end
