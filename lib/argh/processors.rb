module Argh
  module Processors

    base = File.dirname(File.expand_path(__FILE__))

    autoload :JCommanderProcessor, base + '/processors/jcommander_processor'
    autoload :BaseProcessor, base + '/processors/base_processor'

  end
end
