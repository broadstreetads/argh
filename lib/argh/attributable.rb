module Argh
  module Attributable

    DEFAULT_FORMATTER = Formatters::JCommanderFormatter

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

      def argh(name, formatter_klass = DEFAULT_FORMATTER, &block)
        collector = Collector.new(&block)
        mod = Module.new
        mod.send(:define_method, name) do
          formatter = formatter_klass.new collector, self
          formatter.process
        end
        # Extend this module onto ourselves
        self.send(:include, mod)
      end

    end

  end
end
