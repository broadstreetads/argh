module Argh

  class Collector

    attr_reader :attributes

    def initialize(&block)
      @attributes = []
      instance_eval(&block)
    end

    def attribute(name, value = nil, &block)
      @attributes << {
        :name => name,
        :value => value,
        :lambda => block || lambda { |i| i.send(name) }
      }
    end

  end

end
