require 'spec_helper'
require_relative '../string_calculator'

describe StringCalculator do
  
  describe '#add' do
    it 'returns 0 when the string is empty' do
      expect(subject.add("")).to eq(0)
    end

    it 'return the sum of numbers separated by commas' do
      expect(subject.add("1,2,3")).to eq(6)
    end

    it 'return the sum of numbers separated by multiple commas' do
      expect(subject.add("1,2,,3")).to eq(6)
    end

  end

end