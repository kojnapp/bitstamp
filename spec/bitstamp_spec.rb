require 'spec_helper'

describe Bitstamp do

  it 'should raise if not properly configured' do
    -> { Bitstamp.sanity_check! }.should raise_error
  end

  it 'should not raise if properly configured' do
    Bitstamp.setup do |config|
      config.key = 'test'
      config.secret = 'test'
    end

    -> { Bitstamp.sanity_check! }.should_not raise_error
  end

  it 'should have a orders helper method' do
    Bitstamp.should respond_to :orders
  end

  it 'should have a ticker helper method' do
    Bitstamp.ticker.should be_kind_of Bitstamp::Ticker
  end

  it 'should list information about your balance' do
    read_bitstamp_yaml

    Bitstamp.balance.should be_kind_of Hash
  end

  it 'should have a order_book method' do
    Bitstamp.order_book.should be_kind_of Hash
  end

  it 'should have bids and asks in the order_book' do
    order_book = Bitstamp.order_book
    order_book.should have_key("asks")
    order_book.should have_key("bids")
    order_book["asks"].should be_kind_of Array
    order_book["bids"].should be_kind_of Array
  end
end
