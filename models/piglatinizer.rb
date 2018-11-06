class PigLatinizer

  def piglatinize(words)
   words.split(" ").collect {|word| self.pig_word(word)}.join(" ")
  end

  def pig_word(word)
    vowels = %w{a e i o u}
   word.each_char do |chr|
   index = word.index(chr)
   if index != 0 && vowels.include?(chr.downcase)
     consonants = word.slice!(0..index-1)
     return word + consonants + "ay"
   elsif index == 0 && vowels.include?(chr.downcase)
     return word + "way"
   end
 end
  end
end
