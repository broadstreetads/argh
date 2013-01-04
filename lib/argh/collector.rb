module Argh

  class Collector

    attr_reader :attributes

    def initialize(&block)
      @attributes = []
      instance_eval(&block)
    end

    def attribute(name, value = nil, &block)
      attribute = nil
      if value.is_a?(Symbol)
        attribute = value
        value = nil
      end
      @attributes << {
        :name => name,
        :value => value,
        :lambda => block || lambda { |i| i.send(attribute || name) }
      }
    end

  end

end
