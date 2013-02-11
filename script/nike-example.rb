#!/usr/bin/env ruby
require 'json'
require 'yaml'

url = "https://api.nike.com/me/sport/activities?access_token=#{ENV['NIKE_ACCESS_TOKEN']}"

# Can open public URL with this http://nikeplus.nike.com/plus/activity/running/adamloving/detail/2099952663

data = `curl -H "appid: fuelband" -H "Accept: application/json" "#{url}"`
data = JSON.parse(data)

# data = JSON.parse(open('test/fixtures/nike-activity-sample.js').read)

puts data.to_yaml

for activity in data['data']
  if activity['activityType'] == 'ALL_DAY'
    puts "STEPS: #{activity['startTime']} #{activity['steps']}"
  end
end

# update the total for the day matching start time, the entry will continue to update until the end of the day
# (can output differential as status)