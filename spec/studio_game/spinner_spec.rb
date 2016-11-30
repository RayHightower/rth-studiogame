require 'studio_game/spinner'

module StudioGame

  describe Spinner do
    before do
      @spinner = Spinner.new
    end

    it 'should spin an integer greater than or equal to one' do
      # @spinner.spin.should >= 1
      expect(@spinner.spin).to be >= 1
    end

    it 'should spin an integer less than or equal to six' do
      expect(@spinner.spin).to be <= 6
    end

  end
end
