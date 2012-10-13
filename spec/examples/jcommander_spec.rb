require_relative '../spec_helper'

# To facilitate examples
class JCommanderExample
  attr_accessor :attr
  include Argh::Attributable
  argh 'console_attributes', Argh::Processors::JCommanderProcessor do
    attribute :attr
  end
end

##########

describe Argh::Processors::JCommanderProcessor do

  let(:attr) { nil }
  let(:result) do
    example = JCommanderExample.new
    example.attr = attr
    example.console_attributes
  end

  describe 'with a fixnum attribute' do

    let(:attr) { 123 }

    it 'should return the arguments properly' do
      result.should == '-attr 123'
    end

  end

  describe 'with a true attribute' do

    let(:attr) { true }

    it 'should return only the name of the attribute' do
      result.should == '-attr'
    end

  end

  describe 'with a false attribute' do

    let(:attr) { false }

    it 'should return an empty string' do
      result.should == ''
    end

  end

  describe 'with a nil attribute' do

    let(:attr) { nil }

    it 'should return an empty string' do
      result.should == ''
    end

  end

  describe 'with a string attribute' do

    describe 'a clear string' do

      let(:attr) { 'John Crepezzi' }

      it 'should return the arguments properly' do
        result.should == %q{-attr 'John Crepezzi'}
      end

    end

    describe 'a string including single quotes' do

      let(:attr) { 'John \' Crepezzi' }

      it 'should return the arguments properly escaped' do
        result.should == %q{-attr 'John '\'' Crepezzi'}
      end

    end

  end

end
