require_relative 'list.rb'
class TodoBoard
    
    def initialize(label)
        @list = List.new(label)
    end

    def get_command
        p "Enter a command:"
        cmd, *args = gets.chomp.split(' ')

        case cmd
        when 'mktodo'
            @list.add_item(*args)
            return true
        when 'up'
            if args.length == 1
                @list.up(args[0].to_i)
            else
                @list.up(args[0].to_i, args[1].to_i)
            end
            return true
        when 'down'
            if args.length == 1
                @list.down(args[0].to_i)
            else
                @list.down(args[0].to_i, args[1].to_i)
            end
            return true
        when 'swap'
            @list.swap(args[0].to_i, args[1].to_i)
            return true
        when 'sort'
            @list.sort_by_date!
            return true
        when 'priority'
            @list.print_priority
            return true
        when 'print'
            if args.empty?
                @list.print
            else
                @list.print_full_item(args[0].to_i)
            end
            return true
        when 'quit'
            return false
        else
            p 'Sorry that command is not recognized'
            return true
        end
    end

    def run
        while self.get_command == true

        end
    end



end
