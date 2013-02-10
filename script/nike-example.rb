#!/usr/bin/env ruby
require 'json'
require 'yaml'

url = "https://api.nike.com/me/sport/activities?access_token=#{ENV['NIKE_ACCESS_TOKEN']}"

# Can open public URL with this http://nikeplus.nike.com/plus/activity/running/adamloving/detail/2099952663

# puts `curl -H "appid: fuelband" -H "Accept: application/json" "#{url}"`

data = JSON.parse(open('test/fixtures/nike-activity-sample.js').read)

puts data.to_yaml

for activity in data['data']
  if activity['activityType'] == 'ALL_DAY'
    puts "STEPS: #{activity['startTime']} #{activity['steps']}"
  end
end
