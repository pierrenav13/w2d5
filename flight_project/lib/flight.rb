
class Flight
    attr_reader :passengers

    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end
    
    def full?
        return true if @passengers.length == @capacity
        false
    end

    def board_passenger(passenger)
        if full? == false
            @passengers << passenger if passenger.has_flight?(@flight_number)
        end
    end

    def list_passengers
        array = @passengers.map {|passenger|  passenger.name}
    end
    
    def [](index)
        @passengers[index]
    end

    def <<(passenger)
        board_passenger(passenger)
    end

end