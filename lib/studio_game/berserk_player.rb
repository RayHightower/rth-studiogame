require_relative 'player'

module StudioGame

  class BerserkPlayer < Player

    def initialize(name,initial_health)
      super(name,initial_health)
      @w00t_count = 0
    end

    def berserk?
      if @w00t_count > 5
        true
      else
        false
      end
    end

    def w00t
      super
      @w00t_count += 1

      if self.berserk?
        puts "I am berserk #{self.name} and you are only making it worse!!!\n\n"
      end

    end

    def blam
      if self.berserk?
        w00t
      end
    end

  end


  if __FILE__ == $0
    berserker = BerserkPlayer.new("berserker", 50)
    6.times { berserker.w00t }
  end

  if __FILE__ == $0
    berserker = BerserkPlayer.new("berserker", 50)
    6.times { berserker.w00t }
    2.times { berserker.blam }
    puts berserker.health
  end
end

