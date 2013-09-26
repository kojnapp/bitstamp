require 'spec_helper'

describe Bitstamp::Orders do
  before { read_bitstamp_yaml }

  describe :all, vcr: {cassette_name: 'bitstamp/orders/all'} do
    subject { Bitstamp.orders.all }
    it { should be_kind_of Array }
    describe "first order" do
      subject { Bitstamp.orders.all.first }
      its(:price) { should == "1.01" }
      its(:amount) { should == "1.00000000" }
      its(:type) { should == 0 }
      its(:datetime) { should == "2013-09-26 22:01:35" }
    end
  end

  describe :sell do
    context "no bitcoins available", vcr: {cassette_name: 'bitstamp/orders/sell/failure'} do
      subject { Bitstamp.orders.sell(:amount => 1, :price => 1000) }
      it { should be_kind_of Bitstamp::Order }
      its(:error) { should == {"__all__"=>["You have only 0 BTC available. Check your account balance for details."]} }
    end
    # context "bitcoins available", vcr: {cassette_name: 'bitstamp/orders/sell/success'} do
    #   subject { Bitstamp.orders.sell(:amount => 1, :price => 1000) }
    #   xit { should be_kind_of Bitstamp::Order }
    #   its(:error) { should be_nil }
    # end
  end

  describe :buy, vcr: {cassette_name: 'bitstamp/orders/buy'} do
    subject { Bitstamp.orders.buy(:amount => 1, :price => 1.01) }
    it { should be_kind_of Bitstamp::Order }
    its(:price) { should == "1.01" }
    its(:amount) { should == "1" }
    its(:type) { should == 0 }
    its(:datetime) { should == "2013-09-26 22:01:34.650427" }
    its(:error) { should be_nil }
  end
end
