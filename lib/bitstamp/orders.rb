module Bitstamp
  class Orders < Bitstamp::Collection
    def all(options = {})
      parse_objects! Bitstamp::Net::post('/open_orders').body_str, self.model
    end
  end

  class Order < Bitstamp::Model
    BUY  = 0
    SELL = 1

    attr_accessor :type, :amount, :price, :id, :datetime
  end
end
