require_relative 'auditable'

module StudioGame

  class Spinner

    include Auditable

    attr_reader :number

    def initialize
      spin
    end

    def spin
      @number = rand(1..6)
      audit
      @number
    end

  end
end

