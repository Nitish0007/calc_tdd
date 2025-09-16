require 'spec_helper'
require_relative '../string_calculator'

describe StringCalculator do
  
  describe '#add' do
    it 'returns 0 when the string is empty' do
      expect(subject.add('')).to eq(0)
    end
  end

end