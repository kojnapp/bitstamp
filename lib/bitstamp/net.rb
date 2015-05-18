module Bitstamp
  module Net
    def self.to_uri(path)
      return "https://www.bitstamp.net/api#{path}/"
    end

    def self.get(path, options={})
      RestClient.get(self.to_uri(path))
    end

    def self.post(path, options={})
      RestClient.post(self.to_uri(path), self.bitstamp_options(options))
    end

    def self.patch(path, options={})
      RestClient.put(self.to_uri(path), self.bitstamp_options(options))
    end

    def self.delete(path, options={})
      RestClient.delete(self.to_uri(path), self.bitstamp_options(options))
    end

    def self.bitstamp_options(options={})
      if Bitstamp.configured?
        options[:key] = Bitstamp.key
        options[:nonce] = (Time.now.to_f*100000).to_i.to_s
        options[:signature] = HMAC::SHA256.hexdigest(Bitstamp.secret, options[:nonce]+Bitstamp.client_id.to_s+options[:key]).upcase
      end

      options
    end
  end
end
