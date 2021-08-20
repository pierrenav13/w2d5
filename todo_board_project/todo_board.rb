require_relative 'list.rb'
class TodoBoard
    
    def initialize(label)
        @lists = {}
    end

    def get_command
        print "\nEnter a command: "
        cmd, *args = gets.chomp.split(' ')

        case cmd
        when 'mklist'
            @lists[args[0]] = List.new(args[0])
            return true
        when 'ls'
            @lists.keys.each {|label| p label}
            return true
        when 'showall'
            @lists.values.each {|list| list.print}
            return true
        when 'mktodo'
            if args.length == 3
                @lists[args[0]].add_item(args[1], args[2])
            else
                @lists[args[0]].add_item(args[1], args[2], args[3])
            end
            return true
        when 'up'
            if args.length == 2
                @lists[args[0]].up(args[1].to_i)
            else
                @lists[args[0]].up(args[1].to_i, args[2].to_i)
            end
            return true
        when 'down'
            if args.length == 2
                @lists[args[0]].down(args[1].to_i)
            else
                @lists[args[0]].down(args[1].to_i, args[2].to_i)
            end
            return true
        when 'swap'
            @lists[args[0]].swap(args[1].to_i, args[2].to_i)
            return true
        when 'sort'
            @lists[args[0]].sort_by_date!
            return true
        when 'priority'
            @lists[args[0]].print_priority
            return true
        when 'print'
            if args.length == 1
                @lists[args[0]].print
            else
                @lists[args[0]].print_full_item(args[1].to_i)
            end
            return true
        when 'toggle'
            @lists[args[0]].toggle_item(args[1].to_i)
            return true
        when 'rm'
            @lists[args[0]].remove_item(args[1].to_i)
            return true
        when 'purge'
            @lists[args[0]].purge
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

b = TodoBoard.new('Lists')
b.run
