class User < ActiveRecord::Base
  before_save :generate_ref_code

  validates_presence_of :ref_code
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  def generate_ref_code
    self.ref_code = SecureRandom.hex
  end
end
