module Bitstamp
  class Withdrawals < Bitstamp::Collection
    def find(id)
      return self.all.find{|x| x.id.to_s == id.to_s}
    end

    def all(options = {})
      Bitstamp::Helper.parse_objects! Bitstamp::Net::post("/v2/withdrawal-requests").to_str, self.model
    end

    def create(options = {})
      options.reverse_merge!(type: :eth_withdrawal)
      if options[:amount].nil? || options[:address].nil?
        raise MissingConfigExeception.new("Required parameters not supplied, :amount, :address")
      end

      Bitstamp::Helper.parse_object! Bitstamp::Net::post("/v2/#{options[:type]}", options).to_str, self.model
    end
  end

  class Withdrawal < Bitstamp::Model
    attr_accessor :type, :id, :nonce, :amount, :address, :status, :datetime, :transaction_id, :currency
  end
end
