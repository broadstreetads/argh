module Argh
  module Processors

    class BaseProcessor

      def initialize(collector, context)
        @collector = collector
        @context = context
      end

      def attributes(&block)
        return enum_for(:attributes) unless block_given?
        @collector.attributes.each do |attr|
          value = @context.instance_eval(&attr[:lambda])
          yield attr[:name], value
        end
      end

      def process
        raise 'BaseProcessor should be subclassed'
      end

    end

  end
end
