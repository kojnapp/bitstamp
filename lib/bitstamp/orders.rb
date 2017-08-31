module Bitstamp
  class Orders < Bitstamp::Collection
    def all(options = {})
      path = options[:currency_pair] ? "/v2/open_orders/#{currency_pair}" : "/v2/open_orders/all"
      Bitstamp::Helper.parse_objects! Bitstamp::Net::post(path).to_str, self.model
    end

    def create(options = {})
      currency_pair = options[:currency_pair] || "btcusd"
      path = (options[:type] == Bitstamp::Order::SELL ? "/v2/sell/#{currency_pair}" : "/v2/buy/#{currency_pair}")
      Bitstamp::Helper.parse_object! Bitstamp::Net::post(path, options).to_str, self.model
    end

    def sell(options = {})
      options.merge!({type: Bitstamp::Order::SELL})
      self.create options
    end

    def buy(options = {})
      options.merge!({type: Bitstamp::Order::BUY})
      self.create options
    end

    def find(order_id)
      all = self.all
      index = all.index {|order| order.id.to_i == order_id}

      return all[index] if index
    end

    def cancel_all
      Bitstamp::Net::post('/cancel_all_orders').to_str
    end
  end

  class Order < Bitstamp::Model
    BUY  = 0
    SELL = 1

    attr_accessor :type, :amount, :price, :id, :datetime
    attr_accessor :error, :message

    def cancel!
      Bitstamp::Net::post('/v2/cancel_order', {id: self.id}).to_str
    end
  end
end
