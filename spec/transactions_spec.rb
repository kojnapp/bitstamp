require 'spec_helper'

describe Bitstamp::UserTransactions do
  before :each do
    read_bitstamp_yaml
  end

  it "should return an array when querying for all user transactions" do
    Bitstamp.user_transactions.all.should be_kind_of Array
  end
end
