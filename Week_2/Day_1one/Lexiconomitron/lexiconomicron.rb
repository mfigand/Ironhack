class Lexiconomicron

  def eat_t(string)
    noTArray = string.downcase.split(//)
    noTArray.delete("t")
    noTArray.join
  end

  def shazam(array) 
    workArray = array.map do |string|
     eat_t(string.downcase.split(//).reverse.join)
   end
   shazamArray = [workArray[0],workArray[workArray.length-1]]
  end

  def oompa_loompa(array)
    
    workArray = array.map do |string|
        eat_t(string)
    end
    oompa_loompa = []
    workArray.each do |string|
      if string.length <=3
        oompa_loompa << string
      end
        
    end
  end

end

lexi = Lexiconomicron.new
lexi.eat_t("great scott!")
lexi.shazam(["This", "is", "a", "boring", "test"])
lexi.oompa_loompa(["if", "you", "wanna", "be", "my", "lover"])

