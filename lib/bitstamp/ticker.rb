module Bitstamp
  class Ticker < Bitstamp::Model
    attr_accessor :last, :high, :low, :volume, :bid, :ask
  end
end
