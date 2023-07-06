
class Game
  attr_reader :word , :guesses , :display , :guessedLetters ,:allguessedLetters , :guess

  puts "hello world"

  def initialize

    @word =chooseSecretWord
    @display = Array.new(word.length , '-')
    puts display.join
    startGame(word)
  end
  def play
    if @word.include?(@guess)
                    while @word.include?(@guess)
                        @display[word.index(@guess)] = @guess
                         @word[@word.index(@guess)] = '$'
                     end
                      puts "#{@guess} is in the word!"
               
     else
                puts "#{@guess} is not in the word!"
       
                @guessedLetters.push(@guess)
                puts " The wrong guesses letters : "
                  puts @guessedLetters.join
               
     end
        puts @display.join
      
        wordToArray = word.split("")
              if wordToArray.all? {|char| char =='$'}
                    puts "You won!"
                    return 
              else 
                  @guesses -= 1
                  puts "You have #{@guesses} guesses left"
              end
  end
  def saveGame
    
  end
  def startGame(word)
    puts "Welcome to the game!"
    puts "The word is: #{word}"
    puts "Guess a letter"
    puts "You have 10 guesses"
    @guesses = 10
    @guessedLetters = Array.new(word.length)
    @allguessedLetters = Array.new(word.length)
    while @guesses > 0
      @guess = gets.chomp.downcase
      if @guess === 'save'
        saveGame
        return 
      end 
      if @allguessedLetters.include?(@guess)
             puts " you have  preiously chosen this letter"
      else
        play
      end 
         @allguessedLetters << guess
    end
    puts " out of while"
    if @guesses == 0
      puts "You ran out of guesses!"
      puts "The word was: #{word}"
      return 
    end

  end


  def chooseSecretWord

    words=Array.new
    dictionary = File.open('words.txt' , 'r')
    
    dictionary.each_line do |line|
       if line.length >5 && line.length <12 
        goodword= line.chomp
        goodword = goodword.downcase
        words.push(goodword)
       end
 
  end  
   dictionary.close

   secret = words[rand(0..words.length-1)]
    return  secret
  end
end