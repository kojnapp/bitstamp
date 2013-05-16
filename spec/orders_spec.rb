require 'spec_helper'

describe Bitstamp::Orders do
  before :each do
    read_bitstamp_yaml
  end

  it "should return an array when querying for all orders" do
    Bitstamp.orders.all.should be_kind_of Array
  end
end
