class Oystercard
    MAXVALUE = 90
    attr_reader :balance
    def initialize
        @balance = 0
    end

    def top_up(value)
       raise 'Max value of #{max_value} exceeded' if   @balance + value > MAXVALUE
       @balance += value
    end
end