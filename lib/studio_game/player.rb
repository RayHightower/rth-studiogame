require_relative './treasure_trove'
require_relative 'playable'

module StudioGame
  class Player

    include Playable    # require_relative AND include. belt and suspenders.

    attr_accessor :name, :health
    attr_reader :show, :score

    def initialize(name, health=100)
      @name = name.capitalize
      @health = health
      @points = 0
      @found_treasure = Hash.new(0)
    end

    def score
      @score = @health + @name.length
    end

    def to_s
      return "I\'m #{@name} with a health of #{@health} and a #{score} score.\n#{@name}'s treasure bag contains #{treasure_bag}.\n#{@name}'s Grand Total Points = #{@points}\n\n"
    end

    def <=>(other_player)
      other_player.score <=> @score
    end

    def found_treasure(treasure = TreasureTrove::TREASURES.sample)

      if !@found_treasure
        @found_treasure = Hash.new(0)
      end

      @found_treasure[treasure.name.to_sym] += treasure.points
      puts "Treasure selected in \'found_treasure\' method: #{treasure.name}"

    end

    def treasure_bag
      return "no treasure in this bag" if !@found_treasure
      @found_treasure
    end

    def points
      return 0 if @found_treasure.size == 0
      @points = @found_treasure.values.reduce(:+)
    end

    def random_stuff
      0
    end

    def each_found_treasure

      @found_treasure.each do |key, value|
        yield Treasure.new(key, value)
      end

    end
  end

  if __FILE__ == $0
    player1 = Player.new("moe")
    player2 = Player.new("larry", 600)
    player3 = Player.new("curly", 1295)

    puts player1
    puts player2
    puts player3

    puts "#{player1.name}'s found treasure: #{player1.found_treasure}"
    puts "#{player1.name}'s points: #{player1.points}"
  end
end


