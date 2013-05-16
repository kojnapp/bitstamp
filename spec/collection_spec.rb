require 'spec_helper'

class Bitstamp::Coin < Bitstamp::Model;end
class Bitstamp::Coins < Bitstamp::Collection;end

describe Bitstamp::Coins do
  let(:kojns) { Bitstamp::Coins.new }

  it 'should have a name representing the class his name but not modules' do
    kojns.name.should eq 'coin'
  end

  it 'module should reflect a singular form' do
    kojns.module.should eq "bitstamp/coin"
  end

  it 'should have a model' do
    kojns.model.should be Bitstamp::Coin
  end

  it 'should have an api end point' do
    kojns.path.should eq "/api/coins"
  end
end
