class User < ActiveRecord::Base
  before_save :generate_ref_code

  validates_presence_of :ref_code
  def generate_ref_code
    self.ref_code = SecureRandom.hex
  end
end
