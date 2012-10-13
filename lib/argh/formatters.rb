module Argh
  module Formatters

    base = File.dirname(File.expand_path(__FILE__))

    autoload :JCommanderFormatter, base + '/formatters/jcommander_formatter'
    autoload :BaseFormatter, base + '/formatters/base_formatter'

  end
end
