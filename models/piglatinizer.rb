class PigLatinizer
    def piglatinize_word(word)
      alpha = ('a'..'z').to_a
      vowels = %w[a e i o u]
      consonants = alpha - vowels

      if vowels.include?(word[0].downcase)
        word + "way"
      elsif consonants.include?(word[0].downcase) && consonants.include?(word[1]) && consonants.include?(word[2])
        word[3..-1] + word[0..2] + "ay"
      elsif consonants.include?(word[0].downcase) && consonants.include?(word[1])
        word[2..-1] + word[0..1] + "ay"  
      elsif consonants.include?(word[0].downcase)
        word[1..-1] + word[0] + "ay"
      end
    end

    def piglatinize(input)
      if input.include?(" ")
        arr = input.split(" ")
        arr.map do |word|
          piglatinize_word(word)
        end.join(" ")
      else
        piglatinize_word(input)
      end 
    end
end 