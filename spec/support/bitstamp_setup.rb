RSpec.configure do |config|
  config.before(:each) do
    # The famous singleton problem
    Bitstamp.setup do |config|
      config.key = nil
      config.secret = nil
    end
  end
end

def read_bitstamp_yaml
  Bitstamp.setup do |config|
    raise "You must set environment variable BITSTAMP_KEY and BITSTAMP_SECRET with your username and password to run specs." if ENV['BITSTAMP_KEY'].nil? or ENV['BITSTAMP_SECRET'].nil?
    config.key = ENV['BITSTAMP_KEY']
    config.secret = ENV['BITSTAMP_SECRET']
  end
end
