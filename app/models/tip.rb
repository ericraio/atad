class Tip < ActiveRecord::Base
  include Concerns::Slug
  slug :subject

  validates_presence_of :subject
  validates_presence_of :body
end
