
WIN_COMBINATIONS =
  [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8],
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i-1
end

def move(array, user_input, value="X")
  array[user_input]=value
end


def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  WIN_COMBINATIONS.each {|win_combo|
  index_0 = win_combo[0]
  index_1= win_combo[1]
  index_2=win_combo[2]
  position_1 = board[index_0]
  position_2=board[index_1]
  position_3= board[index_2]

  if position_1 == "X" && position_2 =="X" && position_3 == "X"
    return win_combo
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combo
  end
}
return false
end

def full?(board)
  board.all? {|index| index == "X" || index == "O"}
end

def draw?(board)
if full?(board) && !won?(board)
  true
else
  false
end
end

def inprogress?(board)
   board.any? {|index| index== " " || index == ""}
    end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  elsif inprogress?(board)
    false
  end
end

def winner(board)
  index = []
  index = won?(board)
  if index == false
    return nil
  else
    if board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end

def valid_move?(board, index)
  def position_taken?(array, ind)
    if array[ind] == " " || array[ind] == "" || array[ind] == nil
      return false
    else
      return true
    end
  end

  def turn (board)
    puts "Please enter 1-9:"
    num = gets.chomp
    index = input_to_index(num)
    if valid_move?(board, index) == true
      move(board, index)
      display_board(board)
    else
      turn(board)
    end
  end
end
