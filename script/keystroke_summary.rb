#!/usr/bin/env ruby

# This script reads a plain text key logger file, and calculates
# the number of new keystrokes added
# 
# Here is the mac keylogger: https://code.google.com/p/logkext/wiki/ReadMe
# (it must be configured to leave an unencrypted log file)

# todo: set up a cron to post number of key strokes to featbeat
# crontab -e
# */10 * * * * date >> ~/temp.txt

# todo: Handle the case when the log file not present or smaller than previous lines read

keylog_file = '/Library/Preferences/com.fsb.logKext'
progress_file = '~/key-progress.txt'

last_read_line = `cat #{progress_file}`.to_i
total_lines = `wc -l /Library/Preferences/com.fsb.logKext`.strip.split(' ').first.to_i

puts "Last read line: #{last_read_line}, Total lines: #{total_lines}"

lines_to_read = total_lines - last_read_line

if lines_to_read > 0
  lines = `tail -n #{lines_to_read} #{keylog_file}`

  # record how many lines we read
  `echo #{total_lines} > #{progress_file}`

  # remove any lines starting with \n![ (logKext comments)
  clean = lines.gsub(/\n\!\[.*\]/i, '')

  # process the non-character 'modifier' keys
  # TODO: rollup
  # m = s.scan(/\<[a-z]+\>/)

  clean = clean.gsub(/\<[a-z]+\>/i, '')
  clean = clean.gsub(/\n/i, '')

  puts "total keystrokes: #{clean.length}"
else
  puts "up to date"
end