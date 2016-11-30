module StudioGame

  module Playable

    def w00t
      puts "\n#{name} got w00ted!"
      self.health += 15
    end

    def blam
      puts "\n#{name} got blammed!"
      self.health -= 10
    end

    def strong?  # RSpec allows some syntactic sugar w/predicate methods.
      self.health > 100
    end

  end
end
