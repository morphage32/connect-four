class Player
  attr_reader :name, :symbol
  def initialize(name)
    @name = name
    @symbol = ""
  end

  def set_symbol()
    until @symbol.length == 1 do
      puts "Please enter a single character for #{name}:"
      @symbol = gets.chomp
    end
  end
end