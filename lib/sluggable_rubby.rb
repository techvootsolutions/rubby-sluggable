require_relative "sluggable_rubby/version"

module SluggableRubby
  module ActiveRecord
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def has_slug(*attributes, scope: nil)
        before_validation :generate_slug

        validates :slug, presence: true, uniqueness: { scope: scope }

        define_singleton_method :find_by_slug do |slug|
          find_by(slug: slug)
        end

        define_method(:generate_slug) do
          return unless attributes.any? { |attr| !send(attr).nil? }

          base_slug = attributes.map { |attr| send(attr).to_s.parameterize }.join('-').truncate(50, omission: '').downcase
          self.slug = self.class.unique_slug(base_slug, scope, scope ? self.send(scope) : nil)
        end
      end

      def unique_slug(base_slug, scope, scope_value)
        slug = base_slug
        count = 1

        relation = scope ? self.where(scope => scope_value) : self

        while relation.exists?(slug: slug)
          slug = "#{base_slug}-#{count}"
          count += 1
        end

        slug
      end
    end
  end
end
