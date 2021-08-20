
class Item
    
    def self.valid_date?(date_string)
        #Format shoud be YYYY-MM-DD
        month = (1..12).to_a
        day = (1..31).to_a
        date = date_string.split('-')

        return false if date.length != 3
        return false if date[0].length != 4
        return false if !month.include?(date[1].to_i)
        return false if !day.include?(date[2].to_i)
        true
    end

    attr_accessor :title, :description
    attr_reader :deadline, :done

    def initialize(title, deadline, description)
        @title = title
        if !Item.valid_date?(deadline)
            raise StandardError.new 'deadline not valid'
        end
        @deadline = deadline
        @description = description
        @done = false
    end

    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline)
            @deadline = new_deadline
        else
            raise StandardError.new 'deadline not valid'
        end
    end

    def toggle
        @done = !@done
    end

end


# p Item.valid_date?('2019-10-25') # true
# p Item.valid_date?('1912-06-23') # true
# p Item.valid_date?('2018-13-20') # false
# p Item.valid_date?('2018-12-32') # false
# p Item.valid_date?('10-25-2019') # false

