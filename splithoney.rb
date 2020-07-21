# The idea here is to set up an interface to Libhoney that can send to two teams
# WIP

module SplitHoney
  class Client < Libhoney::LogClient
    def initialize(**args)
      super # why does RubyMine add this automatically?
      @libhoney1 = Libhoney::LogClient.new(writekey: ENV['HONEYCOMB_WRITE_KEY_1'], dataset: 'two-hnys-1')
      @libhoney2 = Libhoney::LogClient.new(writekey: ENV['HONEYCOMB_WRITE_KEY_2'], dataset: 'two-hnys-2')
      puts "libhoney1 dataset:", @libhoney1.dataset
      puts "libhoney2 dataset:", @libhoney2.dataset
    end

    def close(should_close)
      super
      @libhoney1.close(should_close)
      @libhoney2.close(should_close)
    end
  end

  class Builder < Libhoney::Builder
    def initialize
      super
    end
  end
end