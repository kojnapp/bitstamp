module Bitstamp
  class Orders < Bitstamp::Collection
    def all(options = {})
      Bitstamp::Helper.parse_objects! Bitstamp::Net::post('/open_orders').body_str, self.model
    end

    def create(options = {})
      path = (options[:type] == Bitstamp::Order::SELL ? "/sell" : "/buy")
      Bitstamp::Helper.parse_object! Bitstamp::Net::post(path, options).body_str, self.model
    end

    def sell(options = {})
      options.merge!({type: Bitstamp::Order::SELL})
      self.create options
    end

    def buy(options = {})
      options.merge!({type: Bitstamp::Order::BUY})
      self.create options
    end
  end

  class Order < Bitstamp::Model
    BUY  = 0
    SELL = 1

    attr_accessor :type, :amount, :price, :id, :datetime
    attr_accessor :error, :message
  end
end
