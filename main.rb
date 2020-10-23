require 'bundler/inline'
gemfile do
  gem 'honeycomb-beeline', source: 'https://rubygems.org'
  gem 'dotenv', source: 'http://rubygems.org'
end
require_relative 'splithoney'

puts 'we are a go'

Dotenv.load


Honeycomb.configure do |config|

  config.sample_hook do
  end

  config.presend_hook do
    # unsanitized
    Libhoney::Client.new
    libhoney.send
  
    # sanitized
    drop_field if sanitized
  end
end

# private, unsanitized
config1 = Honeycomb::Configuration.new
config1.write_key = ENV['HONEYCOMB_WRITE_KEY_1']
config1.dataset = 'two-hnys-1'

# public, sanitized (eventually)
config2 = Honeycomb::Configuration.new
config2.write_key = ENV['HONEYCOMB_WRITE_KEY_2']
config2.dataset = 'two-hnys-2'

client = SplitHoney::Client.new(config1, config2)

client.start_span(name: 'novatest') do
  client.add_field('dog', 'nova') # TODO: `private: true`
  sleep 1
end
