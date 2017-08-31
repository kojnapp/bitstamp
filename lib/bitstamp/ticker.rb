module Bitstamp
  class Ticker < Bitstamp::Model
    attr_accessor :last, :high, :low, :volume, :bid, :ask, :timestamp, :vwap

    def self.from_api(currency_pair)
      Bitstamp::Helper.parse_object!(Bitstamp::Net.get("/v2/ticker/#{currency_pair}").to_str, self)
    end

    def self.method_missing method, *args
      ticker = self.from_api
      return ticker.send(method) if ticker.respond_to? method

      super
    end
  end
end
