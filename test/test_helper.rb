ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def helper_random_word(length=10)
    s = ''
    length.times { s << (97 + rand(26)) }
    s
  end
  
  def helper_random_email
    helper_random_word(5) + '@' + helper_random_word(5) + '.com' 
  end

  def dump_mail(m) 
    if @is_dumping
      puts "---"
      puts "TO: #{m.to}"
      puts "BCC: #{m.bcc}"
      puts "REPLY-TO: #{m.reply_to}"
      puts "SUBJECT: #{m.subject}"
      puts m.body
      puts "---" 
    end
  end

end
