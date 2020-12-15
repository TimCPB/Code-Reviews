class Word_processor

  def initialize
    @dictionary = ["green", "red", "yellow"]
  end

  def check_spelling(str)
    raise "no words found" if str.empty?
    str_array = str.split(" ")
    str_array.map! do |word|
      if !@dictionary.include?(word.downcase)
        "~#{word}~"
      elsif @dictionary.include?(word.downcase)
        word
      end
    end
    str_array.join(" ")
  end

end