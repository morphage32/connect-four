class Board
  attr_reader :grid

  def initialize()
    @grid = Array.new(6) { Array.new(8, nil) }
  end

  def valid_column?(number)
    @grid.each do |row|
      return true if row[number - 1].nil?
    end
    return false
  end

  def add_move(number, symbol)
    i = 5
    j = number - 1

    while i >= 0 do
      if @grid[i][j].nil?
        @grid[i][j] = symbol
        return
      end
      i -= 1
    end
  end

  def check_for_win()
    # check for any empty slots
    moves_left = false
    i = 0
    j = 0
    until i > 5 || moves_left do
      until j > 7 || moves_left do
        moves_left = true if @grid[i][j] == nil
        j += 1
      end
      i += 1
    end
    return "tie" unless moves_left
    # check horizontal
    i = 5
    j = 0
    while i >= 0 do
      while j < 6 do
        if @grid[i][j] && 
          @grid[i][j] == @grid[i][j + 1] &&
          @grid[i][j] == @grid[i][j + 2] &&
          @grid[i][j] == @grid[i][j + 3]
            return @grid[i][j]
        end
        j += 1
      end
      j = 0
      i -= 1
    end

    # check vertical
    i = 5
    j = 0
    while i >= 3 do
      while j < 8 do
        if @grid[i][j] &&
          @grid[i][j] == @grid[i - 1][j] &&
          @grid[i][j] == @grid[i - 2][j] &&
          @grid[i][j] == @grid[i - 3][j]
          return @grid[i][j]
        end
        j += 1
      end
      j = 0
      i -= 1
    end

    # check diagonal
    i = 5
    j = 0
    while i >= 3 do
      while j < 8 do
        if @grid[i][j]
          # check left side
          if j >= 3
            if @grid[i][j] == @grid[i - 1][j - 1] &&
              @grid[i][j] == @grid[i - 2][j - 2] &&
              @grid[i][j] == @grid[i - 3][j - 3]
              return @grid[i][j]
            end
          end
          if j <= 4
            if @grid[i][j] == @grid[i - 1][j + 1] &&
              @grid[i][j] == @grid[i - 2][j + 2] &&
              @grid[i][j] == @grid[i - 3][j + 3]
              return @grid[i][j]
            end
          end
        end
        j += 1
      end
      j = 0
      i -= 1
    end

    return "none"
  end

  def show_board()
    i = 0
    j = 0
    k = 0
    until k > 12
      if k.even?
        puts "---------------------------------"
        print "|" if k < 12
      else
        until j > 7
          print " "
          if @grid[i][j].nil?
            print " "
          else
            print @grid[i][j]
          end
          print " |"
          j += 1
        end
        print "\n"
        j = 0
        i += 1
      end
      k += 1
    end
    puts "| 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |"
    puts "---------------------------------"
  end
end