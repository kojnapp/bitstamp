module Bitstamp
  module Net
    def self.to_uri(path)
      "https://www.bitstamp.net/api/v2#{path}/"
    end

    def self.get(path, options={})
      rest path
    end

    def self.post(path, options={})
      rest path, :post, bitstamp_options(options)
    end

    def self.patch(path, options={})
      rest path, :put, bitstamp_options(options)
    end

    def self.delete(path, options={})
      rest path, :delete, bitstamp_options(options)
    end

    def self.bitstamp_options(options={})
      if Bitstamp.configured?
        options[:key] = Bitstamp.key
        options[:nonce] = (Time.now.to_f*10000).to_i.to_s
        options[:signature] = HMAC::SHA256.hexdigest(Bitstamp.secret, options[:nonce]+Bitstamp.client_id.to_s+options[:key]).upcase
      end

      options
    end

    def self.rest(path, method=:get, options={})
      RestClient::Request.execute(
        method: method,
        url: to_uri(path),
        payload: options,
        ssl_version: 'SSLv23'
      )
    end
  end
end
