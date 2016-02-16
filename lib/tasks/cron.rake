require 'whenever'

namespace :cron do

  desc "write to the cron file"
  task write: :environment do
    Whenever::CommandLine.execute({ write: true })
  end

end
