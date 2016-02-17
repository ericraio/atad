class Tip < ActiveRecord::Base
  include Concerns::Slug
  include Rails.application.routes.url_helpers
  slug :subject
  has_paper_trail

  validates_presence_of :subject
  validates_presence_of :body

  def admin_permalink
    admin_tip_path(self)
  end
end
