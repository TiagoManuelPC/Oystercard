class Oystercard
    MAXVALUE = 90
    MINVALUE = 1
    attr_reader :balance, :station
    def initialize
        @balance = 0
        @station = nil
    end

    def top_up(value)
       raise 'Max value of #{max_value} exceeded' if  max_value(value)
       @balance += value
    end

    def touch_in(station)
        raise 'insuf. founds' if min_val?
        @station = station
    end

    def touch_out
        deduct(MINVALUE)
        @station = nil
    end

    def in_journey?
        !!station
    end

    private

    def deduct(amount)
      @balance -= amount
    end

    def min_val?
        @balance < MINVALUE
    end

    def max_value(value)
       (@balance + value) > MAXVALUE
    end

end