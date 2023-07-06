require_relative 'Game'
def initialize

puts " choose 1 to play new game or 2 to load a saved game"
choice = gets.chomp.to_i
until choice == 1 || choice == 2 
    puts "invalid choice"
    puts " choose 1 to play new game or 2 to load a saved game"
    choice = gets.chomp.to_i
end
if choice == 1
    
    Game.new
    puts " New game ? yes/no"
    choice = gets.chomp.downcase
    if choice == 'yes'
        initialize
    else 
        return 
    end 

# elsif choice == 2
#     Game.load_game
# end
end
end 
initialize

