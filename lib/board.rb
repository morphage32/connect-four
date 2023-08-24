class Board
    attr_reader :grid
    def initialize()
        @grid = Array.new(6, Array.new(8, nil))
    end


end