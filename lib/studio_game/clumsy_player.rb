require_relative 'player'


module StudioGame

  class ClumsyPlayer < Player

    def initialize(name, health, boost_factor)
      super(name, health)
      @boost_factor = boost_factor
    end

    def found_treasure(treasure = TreasureTrove::TREASURES.sample)
      damaged_treasure = Treasure.new(treasure.name, treasure.points/2)
      super(damaged_treasure)
    end

    def w00t
      @boost_factor.times {super}
      puts "#{self.name}'s health is #{@health}"
    end

  end

  if __FILE__ == $0
    clumsy = ClumsyPlayer.new("klutz",100,10)

    hammer = Treasure.new(:hammer, 50)
    clumsy.found_treasure(hammer)
    clumsy.found_treasure(hammer)
    clumsy.found_treasure(hammer)

    crowbar = Treasure.new(:crowbar, 400)
    clumsy.found_treasure(crowbar)

    clumsy.each_found_treasure do |treasure|
      puts "#{treasure.points} total #{treasure.name} points"
    end
    puts "#{clumsy.points} grand total points"

    clumsy.w00t
  end
end

