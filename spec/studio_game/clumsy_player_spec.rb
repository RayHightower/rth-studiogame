require 'studio_game/clumsy_player'

module StudioGame

  describe ClumsyPlayer do
    before do
      @player = ClumsyPlayer.new("klutz",100,10)
    end

    it "initial point value should be zero" do
      expect(@player.points).to eq 0
    end

    it "only gets half the point value for hammers" do
      hammer = Treasure.new(:hammer, 50)
      @player.found_treasure(hammer)
      @player.found_treasure(hammer)
      @player.found_treasure(hammer)

      expect(@player.points).to eq 75
    end

    it "only gets half the point value for crowbars" do
      crowbar = Treasure.new(:crowbar, 400)
      @player.found_treasure(crowbar)

      expect(@player.points).to eq 200
    end

    it "displays the contents of the treasure bag" do
      hammer = Treasure.new(:hammer, 50)
      @player.found_treasure(hammer)
      yielded = []
      @player.each_found_treasure do |treasure|
        yielded << treasure
      end

      expect(yielded).to eq [Treasure.new(:hammer, 75), Treasure.new(:crowbar, 200)]
    end

    it "applies the boost factor as expected" do
      @player.w00t
      expect(@player.health).to eq 250
    end

  end
end
