require_relative './spinner'
# require_relative './loaded_spinner'
require_relative './player'

module StudioGame

  module GameTurn

    def self.take_turn(player)
      number_spun = Spinner.new.spin
      # number_spun = LoadedSpinner.new.spin
      if number_spun >= 5
        player.w00t
      elsif number_spun <= 2
        player.blam
      else
        puts "\n*** #{player.name} was skipped."
      end

      player.found_treasure

    end

    def self.found_treasure(player)
      @treasure = TreasureTrove::TREASURES.sample
      puts "Treasure selected in \'get_treasure\' method: #{@treasure.name}"
    end

  end
end
