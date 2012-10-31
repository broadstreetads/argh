module Argh

  class Collector

    attr_reader :attributes

    def initialize(&block)
      @attributes = []
      instance_eval(&block)
    end

    def attribute(name, attribute = nil, &block)
      @attributes << {
        :name => name,
        :lambda => block || lambda { |i| i.send(attribute || name) }
      }
    end

  end

end
