class Oystercard
    MAXVALUE = 90
    MINVALUE = 1
    attr_reader :balance, :entry_station, :journeys, :exit_station
    def initialize
        @balance = 0
        @entry_station = nil
        @journeys = []
    end

    def top_up(value)
       raise 'Max value of #{max_value} exceeded' if  max_value(value)
       @balance += value
    end

    def touch_in(station)
        raise 'insuf. founds' if min_val?
        @entry_station = station
    end

    def touch_out(station)
        deduct(MINVALUE)
        @exit_station = station
        log_journey
        @entry_station = nil
    end

    def log_journey
        journeys << {entry_station: entry_station, exit_station: exit_station}
    end

    def in_journey?
        !!entry_station
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