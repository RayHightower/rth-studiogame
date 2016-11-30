require_relative 'auditable'

module StudioGame

  class LoadedSpinner

    include Auditable

    attr_reader :number

    def spin
      numbers = [1, 1, 2, 5, 6, 6]
      @number = numbers.sample
      audit
      @number
    end

  end
end
