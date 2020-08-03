require 'bundler/inline'
gemfile do
  gem 'honeycomb-beeline', source: 'https://rubygems.org'
  gem 'dotenv', source: 'http://rubygems.org'
end
require_relative 'splithoney'

puts 'we are a go'

Dotenv.load

hny_private = {
  writekey: ENV['HONEYCOMB_WRITE_KEY_1'],
  dataset: 'two-hnys-1',
}

hny_public = {
  writekey: ENV['HONEYCOMB_WRITE_KEY_2'],
  dataset: 'two-hnys-2'
}

Honeycomb.configure do |config|
  # pass in SplitHoney client object in place of Libhoney
  config.client = SplitHoney::Client.new(config1: hny_private, config2: hny_public)
end

Honeycomb.start_span(name: 'novatest') do |_span|
  sleep 1
end
