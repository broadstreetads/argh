module Argh
  module Processors

    class JCommanderProcessor < BaseProcessor

      def process
        information = []
        attributes.each do |name, value|
          piece = escape(name, value)
          information << piece unless piece.nil?
        end
        information.join ' '
      end

      private

      def escape(name, value)
        case value
        when NilClass, FalseClass then nil
        when TrueClass then "-#{name}"
        when Fixnum then "-#{name} #{value}"
        else "-#{name} '#{value.to_s.gsub(%q{'}) { %q{'\''} }}'"
        end
      end

    end

  end
end
