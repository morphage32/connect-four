require_relative "board.rb"
require_relative "player.rb"

gameboard = Board.new()

puts "Welcome to Connect Four! Please type a name for Player 1: "
name = gets.chomp
name == "" ? (player1 = Player.new("Player 1")) : (player1 = Player.new(name))
player1.set_symbol
puts "Please type a name for Player 2: "
name = gets.chomp
name == "" || name == player1.name ? (player2 = Player.new("Player 2")) : (player2 = Player.new(name))
player2.set_symbol

rand(1..2) == 1 ? (current_player = player1) : (current_player = player2)
winner = "none"

while winner == "none" do
  gameboard.show_board
  puts "#{current_player.name}, it's your turn! Please enter a number for your next move: "
  column = 0
  until column > 0 && column < 9 do
    column = gets.chomp.to_i
    if column > 0 && column < 9
      if gameboard.valid_column?(column)
        gameboard.add_move(column, current_player.symbol)
      else
        puts "Sorry #{current_player.name}, that column is full."
        column = 0
      end
    else
      puts "Sorry #{current_player.name}, invalid selection. Please try again: "
      column = 0
    end
  end
  current_player == player1 ? (current_player = player2) : (current_player = player1)
  winner = gameboard.check_for_win
end

gameboard.show_board

case winner
when player1.symbol
  puts "#{player1.name} wins the game!"
when player2.symbol
  puts "#{player2.name} wins the game!"
when 'tie'
  puts "It's a tie! Well played!" 
end