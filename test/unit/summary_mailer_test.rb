require 'test_helper'

# bundle exec ruby -I"lib:test" test/unit/summary_mailer_test.rb
class ImportMailerTest < ActionMailer::TestCase

  def setup 
    @is_dumping = true
  end

  test "daily reminder" do
    m = SummaryMailer.daily_reminder
    dump_mail(m)
  end

end
