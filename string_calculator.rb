class StringCalculator

  def initialize
    @delimiters = [',']
  end

  def add(input)
    return 0 if input.empty?

    @delimiters.each do |delimiter|
      input = input.gsub(delimiter, ',')
    end

    output = input.split(',').map(&:to_i).sum
    output
  end

end