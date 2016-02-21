class Tip < ActiveRecord::Base
  include Concerns::Slug
  include Rails.application.routes.url_helpers
  slug :subject
  has_paper_trail

  scope :unpublished, -> { where(published_at: nil) }
  scope :published, -> { where.not(published_at: nil) }

  validates_presence_of :subject
  validates_presence_of :body

  def admin_permalink
    admin_tip_path(self)
  end

  def creator
    return @creator if @creator.present?
    version = self.versions.first
    return if version.blank?
    @creator = AdminUser.find(version.whodunnit)
  end

  def updated_by
    return @updated_by if @updated_by.present?
    version = self.versions.last
    return unless version.blank?
    @updated_by = AdminUser.find(version.whodunnit)
  end

end
