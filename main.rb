require 'bundler/inline'
gemfile do
  gem 'honeycomb-beeline', source: 'https://rubygems.org'
  gem 'dotenv', source: 'http://rubygems.org'
end

puts 'we are a go'

api1 = ""
api2 = ""

# we probably don't even need multiple transmission objects
# can just dup the event and change api key/dataset
class MultiHoneyTransmission
  def initialize
    @inner = Libhoney::TransmissionClient.new
  end

  def add(event)
    sanitized = sanitize event
    sanitized.writekey = ""
    sanitized.dataset = "two-hnys-2"

    @inner.add(sanitized)
    @inner.add(event)
  end

  def sanitize(event)
    # deep-ish copy of the event
    duplicate = event.dup.tap do |e|
      # this is bad m'kay
      e.instance_variable_set(:@data, event.data.dup)
    end

    # read in the yml file and blat any fields with those names in
    # do some sanitizing
    duplicate.add_field("this is a duplicate", "test")
  end

  def close(drain)
    @inner.close(drain)
  end
end

multi = MultiHoneyTransmission.new

blah = Libhoney::Client.new(writekey: api1, dataset: "two-hnys-1", transmission: multi)

Honeycomb.configure do |config|
  config.client = blah
end

Honeycomb.start_span(name: 'novatest') do
  Honeycomb.add_field('dog', 'nova') # TODO: `private: true`
  sleep 1
end
