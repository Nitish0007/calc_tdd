require 'spec_helper'
require_relative '../string_calculator'

describe StringCalculator do
  
  describe '.add' do
    it 'returns 0 when the string is empty' do
      expect(StringCalculator.add("")).to eq(0)
    end

    it 'return the sum of numbers separated by commas' do
      expect(StringCalculator.add("1,2,3")).to eq(6)
    end

    it 'return the sum of numbers separated by multiple commas' do
      expect(StringCalculator.add("1,2,,3")).to eq(6)
    end

    it 'return the sum of numbers separated by newlines' do
      expect(StringCalculator.add("1\n2\n3")).to eq(6)
    end

    it 'return the sum of numbers separated by both newlines and commas' do
      expect(StringCalculator.add("1,2\n3")).to eq(6)
    end

    it 'returns the sum of numbers separated by custom delimiter' do
      expect(StringCalculator.add("//;\n1;2;3;4;5")).to eq(15)
    end

    it 'return the sum of numbers separated by custom or default delimiters' do
      expect(StringCalculator.add("//;\n1;2,3;4\n5")).to eq(15)
    end

    it 'raise exception when the input contains negative numbers' do
      expect { StringCalculator.add("-1,2,-3") }.to raise_error(StandardError, "Negative numbers not allowed: -1, -3")
    end

    it 'return sum of numbers less than or equal to 1000' do
      expect(StringCalculator.add("1,2,1001")).to eq(3)
    end

    it 'return sum of numbers less than or equal to 1000 with custom delimiter' do
      expect(StringCalculator.add("//;\n1;2;3;4;5000")).to eq(10)
    end

    it 'return sum of numbers with multiple custom delimiters' do
      expect(StringCalculator.add("//[*][%]\n1*2%3")).to eq(6)
    end

    it 'return sum of numbers with multiple custom delimiters' do
      expect(StringCalculator.add("//[||][;]\n1||2;3")).to eq(6)
    end

    it "return sum of numbers with multiple custom mutli-character delimiters with right pattern" do
      expect(StringCalculator.add("//[***][%%%]\n1***2%%%3")).to eq(6)
    end

    it "return sum of numbers with multiple custom mutli-character delimiters with negative numbers" do
      expect { StringCalculator.add("//[***][%%%]\n1***-2%%%-3") }.to raise_error(StandardError, "Negative numbers not allowed: -2, -3")
    end

    it "return sum of numbers with multiple custom mutli-character delimiters and default delimiters" do
      expect(StringCalculator.add("//[***][%%%]\n1***2%%%3\n4,5")).to eq(15)
    end

    it 'return sum of only first number when multi-character custom delimiters present with wrong pattern' do
      expect(StringCalculator.add("//***\n1*2%3")).to eq(1)
    end

  end

end