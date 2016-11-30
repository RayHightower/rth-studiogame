require 'studio_game/player'

module StudioGame

  describe Player do

    context "strong player" do
      before do
        @player = Player.new("hercules", 150)
      end

      # RSpec allows some syntactic sugar w/predicate methods. strong?
      it "should be a player with strong health" do
        @player.should be_strong
      end
    end

    context "weak player" do
      before do
        @player = Player.new("junior", 100)
      end

      it "should be a player with weak health" do
        @player.should_not be_strong
      end
    end

    context "general player" do

      before do
        @player = Player.new("geronimo", 200)
        @initial_health = @player.health
      end

      it "has an inital health" do
        @player.health.should_not == nil
      end

      it "computes a score as the sum of its health and length of name" do
        @player.score.should == @player.health + @player.name.length
      end

      it "increases health by 15 when w00ted" do
        w00ted_health = @initial_health + 15
        @player.w00t
        @player.health.should == w00ted_health
      end

      it "decreases health by 10 when blammed" do
        blammed_health = @initial_health - 10
        @player.blam
        @player.health.should == blammed_health
      end
    end

    context "treasure tracking" do
      before do
        @player = Player.new("alexander", 150)
      end

      it "starts with a treasure point total of 0" do
        player = Player.new("bartholemew")
        player.points.should == 0
      end

      it "yields each found treasure and its total points" do
        @player.found_treasure(Treasure.new(:skillet, 100))
        @player.found_treasure(Treasure.new(:skillet, 100))
        @player.found_treasure(Treasure.new(:hammer, 50))
        @player.found_treasure(Treasure.new(:bottle, 5))
        @player.found_treasure(Treasure.new(:bottle, 5))
        @player.found_treasure(Treasure.new(:bottle, 5))
        @player.found_treasure(Treasure.new(:bottle, 5))
        @player.found_treasure(Treasure.new(:bottle, 5))

        yielded = []
        @player.each_found_treasure do |treasure|
          yielded << treasure
        end

        puts "\n\n+++++++ We are in player_spec.rb ++++++\n"
  #      yielded.should == [{:skillet=>200, :hammer=>50, :bottle=>25}]

        yielded.should == [
          Treasure.new(:skillet, 200),
          Treasure.new(:hammer, 50),
          Treasure.new(:bottle, 25)
       ]
      end

      it "adds to found treasure and computes resulting points"

      it "adds new treasure, creating keys where needed"

      it "adds another item to the found treasurer"

      it "runs another spec specified by RTH"

    end
  end
end
