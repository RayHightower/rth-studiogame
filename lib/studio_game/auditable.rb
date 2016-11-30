module StudioGame

  module Auditable

    def audit
      puts "Audit: Spun a #{self.number} on the #{self.class}."
      @number
    end

  end
end
