require 'active_support/core_ext'
require 'active_support/inflector'
require 'active_model'
require 'curb'

require 'bitstamp/net'
require 'bitstamp/helper'
require 'bitstamp/collection'
require 'bitstamp/model'

require 'bitstamp/orders'
require 'bitstamp/ticker'

String.send(:include, ActiveSupport::Inflector)

module Bitstamp
  # API Key
  mattr_accessor :key

  # Bitstamp secret
  mattr_accessor :secret

  # Currency
  mattr_accessor :currency
  @@currency = :usd

  def self.orders
    self.sanity_check!

    @@orders ||= Bitstamp::Orders.new
  end

  def self.balance
    self.sanity_check!

    JSON.parse Bitstamp::Net.get('/balance').body_str
  end

  def self.ticker
    return Bitstamp::Ticker.from_api
  end

  def self.setup
    yield self
  end

  def self.sanity_check!
    unless self.key || self.secret
      raise MissingConfigExecption.new("Bitstamp Gem not properly configured")
    end
  end

  class MissingConfigExecption<Exception;end;
end
