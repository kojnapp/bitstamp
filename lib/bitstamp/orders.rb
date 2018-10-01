module Bitstamp
  class Orders < Bitstamp::Collection

    def all(options = {})
      path = options[:currency_pair] ? "/v2/open_orders/#{options[:currency_pair]}" : "/v2/open_orders/all"
      Bitstamp::Helper.parse_objects! Bitstamp::Net::post(path).to_str, self.model
    end

    def create(options = {})
      path = build_path(options)
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

    def status(order_id)
      Bitstamp::Helper.parse_object!(Bitstamp::Net::post('/order_status', id: order_id).to_str, self.model)
    end

    def cancel_all
      Bitstamp::Net::post('/cancel_all_orders').to_str
    end

    private
    def build_path(options={})
      base = "/v2"
      currency_pair = options[:currency_pair] || "btcusd"

      if options[:type] == Bitstamp::Order::SELL
        base += "/sell"
      else
        base += "/buy"
      end

      if options[:market].present?
        base += "/market"
      end

      base += "/#{currency_pair}"

      return base
    end
  end

  class Order < Bitstamp::Model
    BUY  = 0
    SELL = 1

    attr_accessor :type, :amount, :price, :id, :datetime, :status, :reason, :transactions
    attr_accessor :error, :message

    def cancel!
      Bitstamp::Net::post('/v2/cancel_order', {id: self.id}).to_str
    end
  end
end
