class StringCalculator
  DELIMITERS = [',', "\n"]

  def self.add(input)
    return 0 if input.empty?

    DELIMITERS.each do |delimiter|
      input = input.gsub(delimiter, ',')
    end

    output = input.split(',').map(&:to_i).sum
    output
  end

end