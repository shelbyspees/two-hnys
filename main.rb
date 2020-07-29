require 'bundler/inline'
gemfile do
  gem 'honeycomb-beeline', source: 'https://rubygems.org'
  gem 'dotenv', source: 'http://rubygems.org'
end
# require_relative 'splithoney'

puts 'we are a go'

Dotenv.load

Honeycomb.configure do |config|
  config.write_key = ENV['HONEYCOMB_WRITE_KEY_1']
  config.dataset   = 'two-hnys-1'
end

Honeycomb.start_span(name: 'novatest') do |span|
  sleep 1
end