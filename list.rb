class List
    attr_reader :head
    def initialize () 
        @head = nil
    end
	
    def append (value)
		if @head
			current = @head
			while (current.next != nil)
				current = current.next
			end
			current.next = Node.new(value)
		else
			@head = Node.new(value)
		end
    end
	
	def get(id)
		count = 0
		current = @head
		while (count != id and current.next != nil)
			count += 1
			current = current.next
		end
		if count == id
			return current.value
		else 
			return "index out of bounds"
		end
	end
	
	def prepend (value)
		new_node = Node.new(value)
		new_node.next = @head
		@head = new_node
	end
	
	def insert (value,id)
		count = 0
		current = @head
		while (count < id - 1 and current.next != nil)
			count += 1
			current = current.next
		end
		if (id < 0) || (id > count + 1)
			puts "index out of bounds,cant insert"
		elsif count == 0 and count != id -1
			new_node = Node.new(value)
			new_node.next = @head
			@head = new_node
		elsif count != id - 1
			current.next = Node.new(value)
		elsif count == id - 1
			new_node = Node.new(value)
			new_node.next = current.next
			current.next = new_node
		else
			return "index out of bounds"
		end
	end
	
	def count ()
		count = 1
		if(@head != nil)
			current = @head
			while (current.next != nil)
			count += 1
			current = current.next
			end
			return count
		else
			return 0
		end
	end
	
	def remove (id)
		count = 0
		current = @head
		while (count < id - 1 and current.next != nil)
			count += 1
			current = current.next
		end
		if (id < 0) || (id > count + 1) || (current.next == nil)
			puts "index out of bounds,cant remove"
		elsif id == 0
			@head = head.next 
		elsif count == id - 1
			current_next = current.next
			current.next = current_next.next
		elsif count
		else puts "qweqw"
		end
	end
end


class Node
    attr_accessor :next, :value

    def initialize (value) 
        @next = nil
        @value = value
    end
end

l = List.new
puts l.count

l.append "item 1"
l.append "item 2"
l.prepend "item 0"
l.insert "item 1.5", 2

puts l.get 2

l.remove 2

puts l.get 2








