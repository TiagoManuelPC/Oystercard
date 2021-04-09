class Journey
    PENALTY_FARE = 6
    attr_reader :entry_station, :station
    def initialize(entry_station: nil)
        @entry_station = entry_station
        @complete = false
    end
    
    def exit_station(station = nil)
        @exit_station = station
        @complete = true
        return self
    end

    def fare
    return PENALTY_FARE if penalty?
    return 1
    end


    def complete?
        @complete
    end

    def penalty?
        (!entry_station|| !exit_station)
    end
    
end