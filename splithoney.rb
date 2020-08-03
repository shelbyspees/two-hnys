module SplitHoney
  class Client < Libhoney::NullClient # implements the same interface as Libhoney::Client
    def initialize(config1:, config2:)
      super() # grab everything that happens in NullClient#initialize, but with no args
      @libhoney1 = Libhoney::Client.new(config1)
      @libhoney2 = Libhoney::Client.new(config2)
    end

    def send_event(event)
      event1 = event.dup
      event1.writekey = @libhoney1.writekey
      event1.dataset  = @libhoney1.dataset
      @libhoney1.send_event(event1)

      event2 = event.dup
      event2.writekey = @libhoney2.writekey
      event2.dataset  = @libhoney2.dataset
      @libhoney2.send_event(event2)
    end

    def close(drain = true)
      @libhoney1.close(drain)
      @libhoney2.close(drain)
    end
  end
end
