require 'studio_game/game_turn.rb'

# Is it overkill to have this file when other files are covering the GameTurn module with tests?
#
module StudioGame

  describe GameTurn do

    before do
      @player = Player.new("Kirk",100)
    end

    it 'should take a turn'

  #   it 'should grab a treasure item' do
  #     @treasure.name.should_not == nil
  #   end

  end
end
