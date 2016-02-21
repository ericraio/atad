class SlackInviteJob < ActiveJob::Base
  queue_as :default

  def perform(*users)
    users.each do |user|
      begin
        slack_client.invite(email: user.email)
      rescue => e
        Utility.log_exception(e)
      end
    end
  end

  private

  def slack_client
    @slack_client ||= Slack::Client.new \
      subdomain: 'agiletipaday',
      token: Rails.application.secrets.slack_token
  end

end
