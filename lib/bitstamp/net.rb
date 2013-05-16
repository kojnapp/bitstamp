module Bitstamp
  module Net
    def self.to_uri(path)
      #return "http#{Kojn.ssl ? "s" : ""}://#{Kojn.host}:#{Kojn.port}#{path}"
      return "https://www.bitstamp.net/api#{path}/"
    end

    def self.curl(verb, path, options={})
      verb = verb.upcase.to_sym

      c = Curl::Easy.new(self.to_uri(path))

      options[:user] = Bitstamp.key
      options[:password] = Bitstamp.secret

      c.post_body = options.to_query

      c.http(verb)

      return c
    end

    def self.get(path, options={})
      request = self.curl(:GET, path, options)

      request.perform

      return request
    end

    def self.post(path, options={})
      request = self.curl(:POST, path, options)

      request.perform

      return request
    end

    def self.patch(path, options={})
      request = self.curl(:PATCH, path, options)

      request.perform

      return request
    end

    def self.delete(path, options={})
      request = self.curl(:DELETE, path, options)

      request.perform

      return request
    end
  end
end
