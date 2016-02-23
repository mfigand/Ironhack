
class WordChain
    def initialize(dictionary)
        @dictionary = dictionary
    end

    def find_chain(start, final)
      require 'ruby-dictionary'
        startChar = start.split(//)
        while word != true

        end
    end
end

list_of_words = []
dictionary = Dictionary.new(list_of_words)
my_chain = WordChain.new(dictionary)
my_chain.find_chain("cat", "dog")
# cat
# cot
# cog
# dog