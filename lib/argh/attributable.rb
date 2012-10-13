module Argh
  module Attributable

    DEFAULT_PROCESSOR = Processors::JCommanderProcessor

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

      def argh(name, processor_klass = DEFAULT_PROCESSOR, &block)
        collector = Collector.new(&block)
        mod = Module.new
        mod.send(:define_method, name) do
          processor = processor_klass.new collector, self
          processor.process
        end
        # Extend this module onto ourselves
        self.send(:include, mod)
      end

    end

  end
end
