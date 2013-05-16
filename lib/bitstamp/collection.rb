module Bitstamp
  class Collection
    attr_accessor :access_token, :module, :name, :model, :path

    def initialize(api_prefix="/api")
      self.access_token = Bitstamp.key

      self.module = self.class.to_s.singularize.underscore
      self.name   = self.module.split('/').last
      self.model  = self.module.camelize.constantize
      self.path   = "#{api_prefix}/#{self.name.pluralize}"
    end

    def all(options = {})
      parse_objects! Bitstamp::Net::get(self.path).body_str, self.model
    end

    def create(options = {})
      parse_object! Bitstamp::Net::post(self.path, {invoice: options}).body_str, self.model
    end

    def find(id, options = {})
      parse_object! Bistamp::Net::get("#{self.path}/#{id}").body_str, self.model
    end

    def update(id, options = {})
      parse_object! Bitstamp::Net::patch("#{self.path}/#{id}", options).body_str, self.model
    end

    protected
    def parse_objects!(string, klass)
      objects = JSON.parse(string)
      objects.collect do |t_json|
        parse_object!(t_json, klass)
      end
    end

    def parse_object!(object, klass)
      object = JSON.parse(object) if object.is_a? String

      klass.new(object)
    end
  end
end
