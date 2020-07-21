require 'bundler/inline'
gemfile do
  gem 'libhoney', source: 'https://rubygems.org'
  gem 'dotenv', source: 'http://rubygems.org'
end
require_relative 'splithoney'

puts 'we are a go'

Dotenv.load

splithoney = SplitHoney::Client.new()
builder = splithoney.builder({'builder': true})

event = builder.event()
event.add_field('name', 'shelbytest')
event.timestamp = Time.now()
event.send()

splithoney.close(true)
