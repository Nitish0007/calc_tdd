class StringCalculator
  DELIMITERS = [',', "\n"]

  def self.add(input)
    return 0 if input.empty?

    delimiter_part, input_part = separate_delimiter_and_input(input)
    delimiters(delimiter_part).each do |delimiter|
      input_part = input_part.gsub(delimiter, ',')
    end

    output = input_part.split(',').map(&:to_i).sum
    output
  end

  private
  def self.separate_delimiter_and_input(input)
    if input.start_with?("//") && input.include?("\n")
      delimiter_part = input[2..input.index("\n")-1]
      input_part = input[input.index("\n")+1..-1]
    else
      delimiter_part = ""
      input_part = input
    end
    return [delimiter_part, input_part]
  end

  def self.delimiters(delimiter_part)
    DELIMITERS << delimiter_part
  end

end
