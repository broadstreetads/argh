# argh

It can be a huge pain to build arguments for an external command.
There's all of those annoying escaping issues, and you just shouldn't
have to deal with that crap.

Argh makes it easy to define how to serialize some attributes.  Just
include `Argh::Attributable` into any Ruby class, and you're off to
the races.

``` ruby
class Thing

  include Argh::Attributable

  attr_reader :name

  argh 'command_attributes' do
    attribute(:name)
    attribute(:reverse_name) { name.reverse }
  end

  private

  def name
    'Heyoo'
  end

end

Thing.new.command_attributes # "-name 'Heyoo' -reverse_name 'ooyeH'"
```
