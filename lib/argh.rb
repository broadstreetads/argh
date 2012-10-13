module Argh

  base = File.dirname(File.expand_path(__FILE__))

  autoload :Attributable, base + '/argh/attributable'
  autoload :Collector, base + '/argh/collector'
  autoload :Processors, base + '/argh/processors'

  autoload :VERSION, base + '/argh/version'

end
