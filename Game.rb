require "./Player"
require "./Question"

class Game
  attr_accessor :player1, :player2, :first_player_turn, :game_over
  
  def initialize()
    @player1 = Player.new()
    @player2 = Player.new()
    @first_player_turn = true
    @game_over = false
    start()
  end

  def start 
    while (!@game_over) 
      # Generate new question
      q = Question.new()
      # Prompt current player for answer
      puts "Player #{@first_player_turn ? 1 : 2}: " + q.question
      print "> "
      answer = $stdin.gets.chomp.to_i
      # Check if answer is correct
      if answer == q.answer
        puts "Player #{@first_player_turn ? 1 : 2}: " + "YES! You are correct."
        print_score()
      else 
        # If answer is incorrect, adjust scores accordingly & check if game is over
        puts "Player #{@first_player_turn ? 1 : 2}: " + "Seriously? No!"
        @first_player_turn ? @player1.decrement_score() : @player2.decrement_score()
        print_score()
      end
      # Toggle between true and false for player turns
      @first_player_turn = !@first_player_turn
      # If someone has lost, we want to exit this while loop
      @game_over && break
      # Else, we loop again starting with a new turn statement
      puts "----- NEW TURN -----"
    end
    # Once we have a winner, game is over and we say goodbye
    puts "Good bye!"
  end

  # helper to print scores of both players at each iteration of the loop
  def print_score
    # If one of the players has lost, we set game_over to true and trigger the winner() helper
    if @player1.score == 0 || @player2.score == 0
      @game_over = true
      winner()
    else
      puts "P1: #{@player1.score}/3 vs P2: #{@player2.score}/3"
    end
  end

  # Helper to print out the winning statements
  def winner
    if (@player1.score > @player2.score)
      puts "Player 1 wins with a score of #{@player1.score}/3"
    else
      puts "Player 2 wins with a score of #{@player2.score}/3"
    end
    puts "----- GAME OVER -----"
  end
end


