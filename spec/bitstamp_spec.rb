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

  it 'should list information about your balance' do
    read_bitstamp_yaml

    Bitstamp.balance.should be_kind_of Hash
  end
end
