require 'bundler/inline'
gemfile do
  gem 'libhoney', source: 'https://rubygems.org'
  gem 'dotenv', source: 'http://rubygems.org'
end

puts 'we are a go'

Dotenv.load
libhoney = Libhoney::Client.new(writekey: ENV['HONEYCOMB_WRITE_KEY_1'], dataset: 'two-hnys-1')

builder = libhoney.builder({'builder': true})

event = builder.event()
event.add_field('name', 'shelbytest')
event.timestamp = Time.now()
event.send()

libhoney.close(true)
