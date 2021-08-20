require_relative 'item.rb'

class List
    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description = '')
        if Item.valid_date?(deadline)
            my_item = Item.new(title, deadline, description)
            @items << my_item
            true
        else
            false
        end
    end

    def size
        @items.length
    end

    def valid_index?(idx)
        size > idx && idx >= 0
    end

    def swap(idx_1, idx_2)
        return false if !valid_index?(idx_1) || !valid_index?(idx_2)
        @items[idx_1], @items[idx_2] = @items[idx_2], @items[idx_1]
        true
    end

    def [](idx)
        return nil if !valid_index?(idx)
        @items[idx]
    end

    def priority
        @items[0]
    end

    def print
        p "-----#{@label}-----"
       
        p "Idx  | Item   |Deadline  | Done?"
        @items.each_with_index do |ele, idx|
            p "#{idx}   | #{ele.title}  | #{ele.deadline}  | #{ele.done}"
        end
        return
    end

    def print_full_item(idx)
        i = @items[idx]
        if valid_index?(idx)
            p "Title: #{i.title} | Deadline: #{i.deadline} | Description: #{i.description} | Done: #{i.done}"
        end
        return
    end

    def print_priority
        print_full_item(0)
    end

    def up(idx, amnt = 1)
        if valid_index?(idx)
            i = 0
            while idx > 0 && i < amnt
                swap(idx, idx - 1)
                idx -= 1
                i += 1
            end
            true
        else
            false
        end
    end

    def down(idx, amnt = 1)
        if valid_index?(idx)
            i = 0
            while idx < @items.length && i < amnt
                swap(idx, idx + 1)
                idx += 1
                i += 1
            end
            true
        else
            false
        end
    end

    def sort_by_date!
        @items.sort_by! {|item| item.deadline}
    end

    def toggle_item(index)
        @items[index].toggle
    end

    def remove_item(index)
        if valid_index?(index)
            @items.delete_at(index)
            return true
        else
            return false
        end
    end

    def purge
        purged = false
        while purged == false
            purged = true
            @items.each_with_index do |item, idx|
                if item.done == true
                    remove_item(idx) 
                    purged = false
                    break
                end
            end
        end
        return true
    end


end

