# instead of Die and roll, use Spinner and spin
#
require 'studio_game/game'

module StudioGame

  describe Game do
    context "high number from the spinner" do

      before do
        @game = Game.new("streetracer")

        @initial_health = 100
        @player = Player.new("moe", @initial_health)
        @number_of_rounds = 2

        @game.add_player(@player)
      end

      it "w00ts the player when a high number is spun" do
        @spinner = Spinner.any_instance.stub(:spin).and_return(5)
        @game.play(@number_of_rounds)
        @player.health.should == @initial_health + (15 * @number_of_rounds)
      end

      it "does nothing when a medium number is spun" do
        @spinner = Spinner.any_instance.stub(:spin).and_return(4)
        @game.play(@number_of_rounds)
        @player.health.should == @initial_health
      end

      it "blams the player when a low number is spun" do
        @spinner = Spinner.any_instance.stub(:spin).and_return(2)
        @game.play(@number_of_rounds)
        @player.health.should == @initial_health - (10 * @number_of_rounds)
      end

      it "runs guard when another spec is added"

    end
  end
end

