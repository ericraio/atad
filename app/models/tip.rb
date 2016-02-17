class Tip < ActiveRecord::Base
  include Concerns::Slug
  slug :subject
end
