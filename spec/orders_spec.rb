require 'spec_helper'

describe Bitstamp::Orders do
  before :each do
    read_bitstamp_yaml
  end

  it "should return an array when querying for all orders" do
    Bitstamp.orders.all.should be_kind_of Array
  end

  it "should sell bitcoins" do
    Bitstamp.orders.sell(:amount => 1, :price => 1000)
  end

  it "should buy bitcoins" do
    Bitstamp.orders.buy(:amount => 1, :price => 1.01)
  end
end
