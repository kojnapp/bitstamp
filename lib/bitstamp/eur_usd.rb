module Bitstamp
  class EurUsd < Bitstamp::Model
    attr_accessor :sell, :buy

    def self.from_api
      Bitstamp::Helper.parse_object!(Bitstamp::Net.get('/eur_usd').body_str, self)
    end

    def self.method_missing method, *args
      ticker = self.from_api
      return ticker.send(method) if ticker.respond_to? method

      super
    end
  end
end
