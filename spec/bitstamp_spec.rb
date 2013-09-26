require 'spec_helper'

describe Bitstamp do

  describe :sanity_check! do
    context 'not properly configured' do
      it { -> { Bitstamp.sanity_check! }.should raise_error }
    end
    context 'properly configured' do
      before {
        Bitstamp.setup do |config|
          config.key = 'test'
          config.secret = 'test'
        end
      }
      it { -> { Bitstamp.sanity_check! }.should_not raise_error }
    end
  end

  describe :orders do
    it { should respond_to :orders }
  end

  describe :ticket, vcr: {cassette_name: 'bitstamp/ticker'} do
    subject { Bitstamp.ticker }
    it { should be_kind_of Bitstamp::Ticker }
    its(:high) { should == "124.90" }
    its(:last) { should == "124.89" }
    its(:timestamp) { should == "1380232743" }
    its(:bid) { should == "124.70" }
    its(:volume) { should == "7603.35699992" }
    its(:low) { should == "123.00" }
    its(:ask) { should == "124.89" }
  end

  describe :balance, vcr: {cassette_name: 'bitstamp/balance'} do
    before { setup_bitstamp }
    subject { Bitstamp.balance }
    it { should == {"btc_reserved"=>"0", "fee"=>"0.4000", "btc_available"=>"0", "usd_reserved"=>"0", "btc_balance"=>"0", "usd_balance"=>"6953.07", "usd_available"=>"6953.07"} }
  end

  describe :order_book, vcr: {cassette_name: 'bitstamp/order_book'} do
    let(:order_book) { Bitstamp.order_book }
    subject { order_book }
    it { should be_kind_of Hash }
    it { should have_key("asks") }
    it { should have_key("bids") }
    it { order_book["asks"].should be_kind_of Array }
    it { order_book["bids"].should be_kind_of Array }
  end
end
