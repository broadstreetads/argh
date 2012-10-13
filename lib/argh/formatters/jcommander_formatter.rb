module Argh
  module Formatters

    class JCommanderFormatter < BaseFormatter

      def process
        information = []
        attributes.each do |name, value|
          piece = escape(name, value)
          information << piece unless piece.nil?
        end
        information.join ' '
      end

      private

      # NOTE: Strings need to be escaped when they contain a single-quote,
      # by breaking the quote, inserting a ' (escaped) and then re-opening
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
