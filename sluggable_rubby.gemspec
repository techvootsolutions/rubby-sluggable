# frozen_string_literal: true

require_relative "lib/sluggable_rubby/version"

Gem::Specification.new do |spec|
  spec.name = "sluggable_rubby"
  spec.version = SluggableRubby::VERSION
  spec.authors = ["Techvoot solutions"]
  spec.email = ["hello@techvoot.com"]

  spec.summary = "This creates a gem structure that can be used to generate unique slugs for ActiveRecord models in a Rails application based on specified attributes"
  spec.description = "Adjust the has_slug method in your models accordingly to specify the attribute for generating the slug"
  spec.homepage = "https://github.com/techvootsolutions/rubby-sluggable"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["owners"] = "Techvoot solutions"
  spec.metadata["pushed_by"] = "Bristina" 
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/techvootsolutions/rubby-sluggable"
  spec.metadata["changelog_uri"] = "https://github.com/techvootsolutions/rubby-sluggable"

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.files = Dir["lib/**/*.rb"]
 
  spec.add_dependency 'rails', '>= 5.0'
end
