require 'pry'

class TicTacToe
  
  def initialize
    @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [[0, 1, 2], [3 ,4, 5], [6 ,7, 8],
                      [0, 3, 6], [1, 4, 7], [2, 5, 8],
                      [0, 4, 8], [2, 4, 6]]
                      
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index) 
    if @board[index] == " "
      false
    else 
      true
    end
  end
  
  def valid_move?(index)
    (index >= 0 && index <= 8) && !position_taken?(index)
  end
  
  def turn_count
    turn_counter = 0
    @board.each do |place|
      if place == "X" || place == "O"
        turn_counter += 1
      end
    end
    turn_counter
  end
  
  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end
  
  def turn
    puts "Choose a number from 1 - 9"
    input = gets.strip
    index = input_to_index(input)
    player = current_player
    
    if valid_move?(index)
      move(index, player)
      display_board
    else
      puts turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.detect do |win_set|
      if (@board[win_set[0]]) == "X" && (@board[win_set[1]]) == "X" && (@board[win_set[2]]) == "X"
        return win_set
      elsif (@board[win_set[0]]) == "O" && (@board[win_set[1]]) == "O" && (@board[win_set[2]]) == "O"
        return win_set
      end
      false
    end
  end
  
  def full?
    @board.all? {|place| place == "X" || place == "O"}
  end
  
  def draw?
    if full? && !won?
      true
    else
      false
    end
  end
  
  def over?
    if won? || draw?
      true
    end
  end
  
  def winner
    WIN_COMBINATIONS.detect do |win_set|
      if (@board[win_set[0]]) == "X" && (@board[win_set[1]]) == "X" && (@board[win_set[2]]) == "X"
        return "X"
      elsif (@board[win_set[0]]) == "O" && (@board[win_set[1]]) == "O" && (@board[win_set[2]]) == "O"
        return "O"
      end
      nil
    end
  end
  
  def play
    turn until over?
    if won?
      puts"Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end