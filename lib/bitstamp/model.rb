module Bitstamp
  class Model
    if ActiveModel::VERSION::MAJOR <= 3
      include ActiveModel::Validations
      include ActiveModel::Conversion
      extend ActiveModel::Naming

      def initialize(attributes = {})
        self.attributes = attributes
      end
    else
      include ActiveModel::Model
    end

    # Set the attributes based on the given hash
    def attributes=(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end

    # Returns a hash with the current instance variables
    def attributes
      Hash[instance_variables.map { |name| [name, instance_variable_get(name)] }]
    end
  end
end
