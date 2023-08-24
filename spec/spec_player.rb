require_relative '../lib/player.rb'

describe Player do
    describe "#initialize" do
        it "can create a new player with a name and symbol" do
            name = "Tester"
            symbol = "$"
            new_player = described_class.new(name, symbol)
            expect(new_player.name).to eq("Tester")
            expect(new_player.symbol) to eq("$")
        end
    end
end