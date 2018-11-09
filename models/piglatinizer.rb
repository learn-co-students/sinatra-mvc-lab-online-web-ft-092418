class PigLatinizer
    
    VOWELS = ["a", "e", "i", "o", "u"]

    attr_accessor :wordA, :v, :fullText

    def initialize()
        @capitalWord = false
    end
   
    def piglatinize(text) 
        @fullText = text
        textA = @fullText.split(" ")
        ans = textA.map{|w|
            piglatinizeWord(w)
        }
        ans.join(" ")
    end

    def piglatinizeWord(word)
        @wordA = word.split("")
        @v = select_first_vowel
        consGroup = build_cons_group
        if consGroup
            @wordA.shift(consGroup.count)
            consGroup.each do |c|
                @wordA << c
            end
        end
        @wordA = @wordA.flatten.join("")
        if consGroup
            @wordA = @wordA + "ay"
        else
            @wordA = @wordA +"way"
        end
    end

    def select_first_vowel
        VOWELS.each do |v|
            @wordA.each do |c|
                # binding.pry
                return c if VOWELS.include?(c.downcase)
            end
        end
    end

    def build_cons_group
        i = 0
        return nil if VOWELS.include?(@wordA[0].downcase)
        c = @wordA[0]
        consGroup = []
        while c.downcase != @v.downcase
            
            consGroup << c 
            i += 1
            c = @wordA[i]
        end

        consGroup
        
    end



end