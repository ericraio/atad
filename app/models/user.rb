class User < ActiveRecord::Base
  before_validation :generate_ref_code, on: :create
  before_save { |user| user.email = user.email.downcase }

  validates_presence_of :ref_code
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_uniqueness_of :email

  has_many :messages, class_name: "Ahoy::Message"
  has_many :invitees, class_name: 'User', foreign_key: :inviter_id

  belongs_to :inviter, class_name: 'User', foreign_key: :inviter_id

  after_create :send_welcome_email
  after_create :send_slack_invite

  attr_accessor :is_new_record


  def send_welcome_email
    UserMailer.welcome(self).deliver_later
  end

  def send_slack_invite
    SlackInviteJob.perform_later(self)
  end

  def self.email_new_daily_tip_to_subscribers
    tip = Tip.where(published_at: nil).first
    where(daily_emails: true).find_in_batches do |group|
      group.each { |user| user.email_daily_tip(tip) }
    end
    tip.published_at = DateTime.now
    tip.save!
  end

  def self.subscribe(user_params)
    user = self.find_or_initialize_by(email: user_params[:email])
    user.is_new_record = user.new_record?
    if user_params[:inviter_id].to_i == user.id
      user_params.delete(:inviter_id)
    else
      User.increment_counter(:invite_count, user_params[:inviter_id])
    end
    user.assign_attributes(user_params.merge(daily_emails: true))
    user.save!
    user
  end

  def email_daily_tip(tip)
    TipMailer.daily(self, tip).deliver_now
  end

  def generate_ref_code
    self.ref_code = SecureRandom.hex
  end

  def unsubscribe_from_daily_emails
    self.daily_emails = false
    self.save!
  end

  # Access token for a user
  def email_token
    self.class.create_email_token(self.id)
  end

  # Verifier based on our application secret
  def self.verifier
    ActiveSupport::MessageVerifier.new(Rails.application.secrets.secret_key_base)
  end

  # Class method for token generation
  def self.create_email_token(id)
    verifier.generate(id)
  end

  # Get a user from a token
  def self.read_email_token(signature)
    return if signature.nil?
    id = verifier.verify(signature)
    User.find(id)
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    nil
  end

end
