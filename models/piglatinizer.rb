class PigLatinizer
  attr_reader :text

  # def initialize(text)
  #   @text = text.downcase
  #   pl(@text)
  # end

  def piglatinize(str)
    str_arr = str.split.map{|w|
      #binding.pry
      w_arr = w.chars
      if w[0].scan(/[bcdfghjklmnpqrstvwxyz]/i) != []
        my_index = 1
        until w[my_index].scan(/[bcdfghjklmnpqrstvwxyz]/) == []
          my_index += 1
        end
        w_arr.rotate!(my_index)
        w_arr.join + "ay"
      else
        w_arr.join + "way"
      end
    }
    str_arr.join(" ")
  end


end
