# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

env :PATH, ENV['PATH']

set :output, '/var/log/cron.log'

# Requires that your production server is set to UTC time
# Subclass Time and override self.parse to adjust for timezone offset
class TimeInZone < Time
  def initialize
    super
  end

  def self.parse args, utc_offset = 0
    hours = 3600 # seconds in hour
    super(args) - (hours * utc_offset)
  end
end

LOCAL_TIME_ZONE_OFFSET = -7  # Set default offset

# Add helper method to DRY up the cron tasks
def local(time, utc_offset = LOCAL_TIME_ZONE_OFFSET)
  TimeInZone.parse(time, utc_offset)
end

every :weekday, at: local('4:00 am') do
  rake "email:daily_tip"
end
