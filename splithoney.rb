module SplitHoney
  class Client
    def initialize(*configurations)
      @clients = configurations.map do |config|
        Honeycomb::Client.new(configuration: config)
      end

      pp @clients
    end
  end
end
