class Oystercard
    MAXVALUE = 90
    MINVALUE = 1
    attr_reader :balance, :in_journey
    def initialize
        @balance = 0
        @in_journey = false
    end

    def top_up(value)
       raise 'Max value of #{max_value} exceeded' if  max_value(value)
       @balance += value
    end

    def deduct(amount)
      @balance -= amount
    end
    def touch_in
        raise 'insuf. founds' if min_val?
        @in_journey = true
    end
    def touch_out
        
        @in_journey = false
    end


    def in_journey?
        @in_journey
    end

    def min_val?
        @balance < MINVALUE
    end




   def max_value(value)
       (@balance + value) > MAXVALUE
    end
end