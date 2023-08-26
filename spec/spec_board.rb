require_relative '../lib/board.rb'

describe Board do

  test_board = described_class.new

  describe "#initialize" do
    it "should create a new 6x8 grid" do
      expect(test_board.grid.length).to eq(6)
      expect(test_board.grid[0].length).to eq(8)
    end

    it "should be a completely empty grid" do
      test_board.grid.each do |row|
        row.each do |column|
          expect(column.nil?).to be true
        end
      end
    end
  end

  describe "#valid_column?" do
    it "returns true if the given column has any empty slots" do
      test_board.instance_variable_set("@grid", [[nil,nil,nil,nil,nil,nil,nil,nil],
                                                [nil,nil,nil,nil,nil,nil,nil,nil],
                                                [nil,nil,nil,nil,nil,nil,nil,nil],
                                                [nil,nil,"X",nil,nil,nil,"X","O"],
                                                ["O","X","O","X","X","O","O","X"],
                                                ["X","O","X","O","O","X","X","O"]])
      expect(test_board.valid_column?(3)).to be true
    end

    it "returns false if the given row is completely full" do
      test_board.instance_variable_set("@grid", [[nil,nil,"O",nil,nil,nil,nil,nil],
                                                [nil,nil,"X",nil,nil,nil,nil,nil],
                                                [nil,nil,"X",nil,nil,nil,nil,"O"],
                                                [nil,nil,"X",nil,nil,nil,"X","O"],
                                                ["O","O","O","X","X","O","O","X"],
                                                ["X","O","X","O","O","X","X","O"]])
      expect(test_board.valid_column?(3)).to be false
      end
  end

  describe "#add_move" do
    it "should place a symbol at the lowest possible slot on the board" do
      test_board.instance_variable_set("@grid", [[nil,nil,nil,nil,nil,nil,nil,nil],
                                                [nil,nil,nil,nil,nil,nil,nil,nil],
                                                [nil,nil,nil,nil,nil,nil,nil,nil],
                                                [nil,nil,"X",nil,nil,nil,"X","O"],
                                                [nil,"X","O","X",nil,"O","O","X"],
                                                ["X","O","X","O","O","X","X","O"]])
      test_board.add_move(7, "O")
      expect(test_board.grid[2][6]).to eq("O")
    end
  end

  describe "#check_for_win" do
    it "returns a symbol if the grid contains four-in-a-row horizontally" do
      test_board.instance_variable_set("@grid", [[nil,nil,nil,nil,nil,nil,nil,nil],
                                                [nil,nil,nil,nil,nil,nil,nil,nil],
                                                [nil,nil,nil,nil,nil,nil,nil,nil],
                                                [nil,nil,nil,nil,nil,nil,nil,nil],
                                                ["X","X","X","X",nil,"O","O","O"],
                                                ["X","O","X","O","X","O","X","O"]])
      expect(test_board.check_for_win).to eq("X")
    end

    it "returns a symbol if the grid contains four-in-a-row vertically" do
      test_board.instance_variable_set("@grid", [[nil,nil,nil,nil,nil,nil,nil,nil],
                                                [nil,nil,nil,nil,nil,nil,nil,nil],
                                                [nil,nil,nil,"X",nil,nil,nil,nil],
                                                [nil,nil,nil,"X",nil,nil,nil,nil],
                                                ["X",nil,nil,"X",nil,nil,"O",nil],
                                                ["O","O",nil,"X","O",nil,"O",nil]])
      expect(test_board.check_for_win).to eq("X")
    end

    it "returns a symbol if the grid contains four-in-a-row diagonally" do
      test_board.instance_variable_set("@grid", [[nil,nil,nil,nil,nil,nil,nil,nil],
                                                [nil,nil,nil,nil,nil,nil,nil,nil],
                                                [nil,nil,nil,nil,nil,"X",nil,nil],
                                                [nil,nil,"X","O","X","O",nil,nil],
                                                [nil,"X","O","X","O","X","O",nil],
                                                ["X","O","X","O","X","O","X","O"]])
      expect(test_board.check_for_win).to eq("X")
    end

    it "returns 'none' if the grid does not have a four-in-a-row symbol" do
      test_board.instance_variable_set("@grid", [[nil,"X",nil,nil,nil,nil,nil,"O"],
                                                ["X","O","O",nil,nil,"X","X","X"],
                                                ["O","X","O",nil,"O","O","O","X"],
                                                ["O","O","X","X","X","O","O","X"],
                                                ["X","O","X","O","O","X","X","O"],
                                                ["X","X","O","X","O","O","X","O"]])
      expect(test_board.check_for_win).to eq("none")
    end

    it "returns 'tie' if the grid is completely full and there is no four-in-a-row" do
      test_board.instance_variable_set("@grid", [["O","X","O","X","O","X","O","X"],
                                                ["O","X","O","X","O","X","O","X"],
                                                ["X","O","X","O","X","O","X","O"],
                                                ["X","O","X","O","X","O","X","O"],
                                                ["O","X","O","X","O","X","O","X"],
                                                ["O","X","O","X","O","X","O","X"],
                                                ["X","O","X","O","X","O","X","O"],
                                                ["X","O","X","O","X","O","X","O"]])
      expect(test_board.check_for_win).to eq("tie")
    end
  end
end