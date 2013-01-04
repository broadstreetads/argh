require_relative '../spec_helper'

# To facilitate example below
class BasicExample

  include Argh::Attributable

  argh 'single' do
    attribute :name
  end

  argh 'multiple' do
    attribute :name
    attribute :age
  end

  argh 'multiple_reverse' do
    attribute :age
    attribute :name
  end

  argh 'straight' do
    attribute :name, 'john'
  end

  argh 'lambs' do
    attribute(:name) { name.reverse }
  end

  private

  def name
    'John Crepezzi'
  end

  def age
    26
  end

end

##########

describe Argh::Attributable do

  let(:example) { BasicExample.new }

  it 'should have a version' do
    Argh::VERSION.should be_a(String)
  end

  it 'better not define #attribute on example instance' do
    example.should_not respond_to(:attribute)
  end

  it 'should get the value of existing properties' do
    example.single.should == '-name \'John Crepezzi\''
  end

  it 'should be able to serialize multiple attributes' do
    example.multiple.should == '-name \'John Crepezzi\' -age 26'
  end

  it 'should be always bring back attributes in order' do
    example.multiple_reverse.should == '-age 26 -name \'John Crepezzi\''
  end

  it 'should be able to specify a lambda instead of the original' do
    example.lambs.should == '-name \'izzeperC nhoJ\''
  end

  it 'should be able to take straight arguments' do
    example.straight.should == '-name \'john\''
  end

end
