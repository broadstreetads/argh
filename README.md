# argh

[![Build Status](https://secure.travis-ci.org/broadstreetads/argh.png)](http://travis-ci.org/broadstreetads/argh)

It can be a huge pain to build arguments for an external service.
There's all of those annoying escaping issues, and you just shouldn't
have to deal with that crap.

Argh makes it easy to define how to serialize those attributes.

## Installation

``` bash
gem install argh
```

## Usage

Just include `Argh::Attributable` into any Ruby class, and you're off to
the races.

``` ruby
class Thing

  include Argh::Attributable

  argh 'command_attributes' do
    attribute(:name)
    attribute(:reverse_name) { name.reverse }
		attribute(:direct, 'value')
  end

  private

  def name
    'Heyoo'
  end

end

Thing.new.command_attributes # "-name 'Heyoo' -reverse_name 'ooyeH' -direct 'value'"
```

The default formatter is built to work
with and properly escape arguments for [JCommander](http://jcommander.org/),
but it's very easy to add and use your own formatters (_and contribute them_).  For an example,
check out the [JCommanderFormatter](https://github.com/broadstreetads/argh/blob/master/lib/argh/formatters/jcommander_formatter.rb)
implementation.  To use them, you can just pass a second argument to `argh`,
like:

``` ruby
argh 'your_name', SomeOtherFormatter do
	# ...
end
```

## License

See LICENSE
