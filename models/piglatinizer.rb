
class PigLatinizer

  def alter_word(word)
    vowels = ['a','e' ,'i','u' , 'o']
    first_letter = word[0].downcase
  
    if vowels.include?(first_letter)
        word+"way"
      else
        consonants = word.split(/[aeiuo]/)[0]
        word[consonants.size .. -1] + consonants +"ay"
    end
  
  end
  
  def piglatinize(phrase)
    phrase.split(" ").map { |w| self.alter_word(w)}.join(" ")
  end
  
  
  end