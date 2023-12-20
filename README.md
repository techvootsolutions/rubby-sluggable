# SluggableRubby

Welcome to SluggableRubby, a gem designed to generate slugs in Ruby applications. This gem provides functionalities to create to handle situations where duplicate slugs are generated from the same attribute value (e.g., multiple records with the same name attribute).

This modification will create a slug with an appended number (e.g., abc-1, abc-2, etc.) if duplicates are found, ensuring each slug is unique within the database. Adjust the has_slug method in your models accordingly to specify the attribute for generating the slug.

## Installation

To use this gem, add it to your Gemfile:

    gem 'sluggable_rubby'

You can install the gem via:

    gem install sluggable_rubby

## Usage

rails generate model Post name:string slug:string
rails db:migrate

To generate slugs in your Ruby application, you can include the has_slug method in your ActiveRecord models:

    class Post < ApplicationRecord

      include SluggableRubby::ActiveRecord
  
      has_slug :name #Use the method specifying the attribute
  
    end

Replace :name with the attribute you want to base the slug on

This allows flexibility in specifying which attribute should be used to generate the slug for each individual model.

example:

    Post.all

Post Load (0.2ms) SELECT "posts".\* FROM "posts"

  [#<Post:0x00007ff8ca673b60
  id: 1,
  title: "Im slug",
  slug: "im-slug",
  created_at: Mon, 11 Dec 2023 10:26:11.827452000 UTC +00:00,
  updated_at: Mon, 11 Dec 2023 10:26:11.827452000 UTC +00:00>,
  #<Post:0x00007ff8ca673480
  id: 2,
  title: "Im slug",
  slug: "im-slug-1",
  created_at: Mon, 11 Dec 2023 10:26:20.539649000 UTC +00:00,
  updated_at: Mon, 11 Dec 2023 10:26:20.539649000 UTC +00:00>,
  ]
  

Find models by slug:
For convenience, you can use this.

    Post.find_by(slug: "im-groot")

  Post Load (0.2ms) SELECT "posts".\* FROM "posts" WHERE "posts"."slug" = ? LIMIT ? [["slug", "im-groot"], ["LIMIT", 1]]
  
  => #<Post:0x00007f0c3d748970
  id: 1,
  blog_id: 1,
  title: "Im Groot",
  body: nil,
  slug: "im-groot",
  created_at: Tue, 12 Dec 2023 13:41:34.793823000 UTC +00:00,
  updated_at: Tue, 12 Dec 2023 13:41:34.793823000 UTC +00:00>

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/techvootsolutions/rubby-sluggable/issues

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
