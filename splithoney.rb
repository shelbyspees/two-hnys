# The idea here is to set up an interface to Libhoney that can send to two teams
# WIP

module SplitHoney
  class Client < Libhoney::NullClient  # implements the same interface as Libhoney::Client
    def initialize(**args)
      super # grab everything that happens in NullClient#initialize
      client1 = {writekey: ENV['HONEYCOMB_WRITE_KEY_1'], dataset: 'two-hnys-1'}
      client2 = {writekey: ENV['HONEYCOMB_WRITE_KEY_2'], dataset: 'two-hnys-2'}
      @libhoney1 = Libhoney::Client.new(client1)
      @libhoney2 = Libhoney::Client.new(client2)
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

    def close(should_close)
      @libhoney1.close(should_close)
      @libhoney2.close(should_close)
    end
  end
end