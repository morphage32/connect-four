require_relative '../lib/player.rb'

describe Player do
  describe "#initialize" do
    it "can create a new player with a custom name" do
      name = "Tester"
      new_player = described_class.new(name)
      expect(new_player.name).to eq("Tester")
    end
  end

  describe "#set_symbol" do
    it "assigns a symbol when only one character is input" do
      name = "Tester2"
      new_player2 = described_class.new(name)
      allow(new_player2).to receive(:gets).and_return("$")
      allow(new_player2).to receive(:puts).and_return("")
      new_player2.set_symbol
      expect(new_player2.symbol).to eq("$")
    end
  end
end