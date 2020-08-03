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
  dataset: 'two-hnys-1'
}

hny_public = {
  writekey: ENV['HONEYCOMB_WRITE_KEY_2'],
  dataset: 'two-hnys-2'
}

config = Honeycomb::Configuration.new
config.write_key = hny_private[:writekey]
config.dataset = hny_private[:dataset]

client = SplitHoney::Client.new(configuration: config)

client.start_span(name: 'novatest') do
  client.add_field('dog', 'nova') # TODO: `private: true`
  sleep 1
end
