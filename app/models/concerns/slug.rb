module Concerns
  module Slug
    extend ActiveSupport::Concern

    included do
      cattr_accessor :_slug_field

      before_validation :generate_slug

      validates :slug, uniqueness: true, presence: true,
        exclusion: {in: %w[signup login]}, if: :slug_value

      def self.find_by_slug(slug)
        where(slug: slug).first
      end

      def slug_value_change
        self.send("#{slug_field}_change")
      end

      def slug_value_changed?
        self.send("#{slug_field}_changed?")
      end

      def slug_value
        self.send(slug_field)
      end

      def slug_field
        self.class._slug_field
      end

      def generate_slug
        return self.slug if self.slug.present? && !self.slug_value_changed?
        return if slug_value.blank?

        if self.class.unscoped.where(slug: slug_value.parameterize).count > 0
          n = 1
          while self.class.unscoped.where(slug: "#{slug_value.parameterize}-#{n}").count > 0
            n += 1
          end
          self.slug = "#{slug_value.parameterize}-#{n}"
        else
          if self.is_a? ::User
            self.slug = slug_value
          else
            self.slug = slug_value.parameterize
          end
        end
      end
    end

    module ClassMethods
      def slug(field)
        self._slug_field = field.to_s
      end
    end

  end
end
