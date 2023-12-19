# frozen_string_literal: true

require_relative "sluggable_rubby/version"

module SluggableRubby
  module ActiveRecord
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def has_slug(attribute = :title)
        define_method(:generate_slug) do
          return unless respond_to?(attribute) && send(attribute).present?

          base_slug = send(attribute).parameterize
          self.slug = unique_slug(base_slug)
        end

        before_validation :generate_slug
        validates :slug, presence: true, uniqueness: true

        define_singleton_method :find_by_slug do |slug|
          find_by(slug: slug)
        end
      end
    end

    private

    def unique_slug(base_slug)
      slug = base_slug
      count = 1

      while self.class.exists?(slug: slug)
        slug = "#{base_slug}-#{count}"
        count += 1
      end

      slug
    end
  end
end

ActiveRecord::Base.include(SluggableRubby::ActiveRecord)