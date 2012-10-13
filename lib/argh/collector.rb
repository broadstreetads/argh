module Argh

  class Collector

    attr_reader :attributes

    def initialize(&block)
      @attributes = []
      instance_eval(&block)
    end

    def attribute(name, &block)
      @attributes << {
        :name => name,
        :lambda => block || lambda { |i| i.send(name) }
      }
    end

  end

end
