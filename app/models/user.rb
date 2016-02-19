class User < ActiveRecord::Base
  before_validation :generate_ref_code, on: :create

  has_many :invitees, class_name: 'User', foreign_key: :inviter_id
  belongs_to :inviter, class_name: 'User', foreign_key: :inviter_id

  validates_presence_of :ref_code
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  def self.subscribe(user_params)
    user = self.find_or_initialize_by(email: user_params[:email])
    user.assign_attributes(user_params.merge(daily_emails: true))
    user.save!
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
