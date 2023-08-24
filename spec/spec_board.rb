require_relative '../lib/board.rb'

describe Board do
    describe "#initialize" do
        it "should create a new 6x8 grid" do
            test_board = described_class.new
            expect(test_board.grid.length).to eq(6)
            expect(test_board.grid[0].length).to eq(8)
        end

        xit "should be a completely empty grid" do
            test_board = described_class.new
            expect(test_board.grid.empty?).to be true
        end
    end

    test_board = described_class.new

    describe "#valid_column?" do
        xit "returns true if the given column has any nil slots" do
            test_board.instance_variable_set([[],[],[],[],[],[],[],[]],
                                            [[],[],[],[],[],[],[],[]],
                                            [[],[],[],[],[],[],[],[]],
                                            [[],[],["X"],[],[],[],["X"],["O"]],
                                            [["O"],["X"],["O"],["X"],["X"],["O"],["O"],["X"]],
                                            [["X"],["O"],["X"],["O"],["O"],["X"],["X"],["O"]])
            expect(test_board.valid_column?(3)).to be true
        end

        xit "returns false if the given row is completely full" do
            test_board.instance_variable_set([[],[],["O"],[],[],[],[],[]],
                                            [[],[],["X"],[],[],[],[],[]],
                                            [[],[],["X"],[],[],[],[],["O"]],
                                            [[],[],["X"],[],[],[],["X"],["O"]],
                                            [["O"],["O"],["O"],['X'],["X"],["O"],["O"],["X"]],
                                            [["X"],["O"],["X"],["O"],["O"],["X"],["X"],["O"]])
            expect(test_board.valid_column?(3)).to be false
        end
    end

    describe "#add_move" do
        xit "should place a symbol at the lowest possible slot on the board" do
            test_board.instance_variable_set([[],[],[],[],[],[],[],[]],
                                            [[],[],[],[],[],[],[],[]],
                                            [[],[],[],[],[],[],[],[]],
                                            [[],[],["X"],[],[],[],["X"],["O"]],
                                            [[],["X"],["O"],["X"],[],["O"],["O"],["X"]],
                                            [["X"],["O"],["X"],["O"],["O"],["X"],["X"],["O"]])
            test_board.add_move(7, "O")
            expect(test_board.grid[2][6]).to eq("O")
        end
    end

    describe "#check_for_win" do
        xit "returns a symbol if the grid contains four-in-a-row horizontally" do
            test_board.instance_variable_set([[],[],[],[],[],[],[],[]],
                                            [[],[],[],[],[],[],[],[]],
                                            [[],[],[],[],[],[],[],[]],
                                            [[],[],[],[],[],[],[],[]],
                                            [["X"],["X"],["X"],["X"],[],["O"],["O"],["O"]],
                                            [["X"],["O"],["X"],["O"],["X"],["O"],["X"],["O"]])
            expect(test_board.check_for_win).to eq("X")
        end

        xit "returns a symbol if the grid contains four-in-a-row vertically" do
            test_board.instance_variable_set([[],[],[],[],[],[],[],[]],
                                            [[],[],[],[],[],[],[],[]],
                                            [[],[],[],["X"],[],[],[],[]],
                                            [[],[],[],["X"],[],[],[],[]],
                                            [["X"],[],[],["X"],[],[],["O"],[]],
                                            [["O"],["O"],[],["X"],["O"],[],["O"],[]])
            expect(test_board.check_for_win).to eq("X")
        end

        xit "return a symbol if the grid contains four-in-a-row diagonally" do
            test_board.instance_variable_set([[],[],[],[],[],[],[],[]],
                                            [[],[],[],[],[],[],[],[]],
                                            [[],[],[],[],[],["X"],[],[]],
                                            [[],[],["X"],["O"],["X"],["O"],[],[]],
                                            [[],["X"],["O"],["X"],["O"],["X"],["O"],[]],
                                            [["X"],["O"],["X"],["O"],["X"],["O"],["X"],["O"]])
            expect(test_board.check_for_win).to eq("X")
        end

        xit "return 'none' if the grid does not have a four-in-a-row" do
            test_board.instance_variable_set([[],["X"],[],[],[],[],[],["O"]],
                                            [["X"],["O"],["O"],[],[],["X"],["X"],["X"]],
                                            [["O"],["X"],["O"],[],["O"],["O"],["O"],["X"]],
                                            [["O"],["O"],["X"],["X"],["X"],["O"],["O"],["X"]],
                                            [["X"],["O"],["X"],["O"],["O"],["X"],["X"],["O"]],
                                            [["X"],["X"],["O"],["X"],["O"],["O"],["X"],["O"]])

            expect(test_board.check_for_win).to eq("none")
        end
    end
end