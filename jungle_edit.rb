class Node
  attr_accessor :data, :link

  def initialize(data, link=nil)
    @data = data # => "data"
    @link = link # => "pointer / next / link to next node"
  end
end

class List
  attr_accessor :name
  attr_reader :head, :tail

  def initialize # => establishes Head and Tail positions as nil on new List
    @head = nil
    # @tail = nil
  end

  def list_empty? # => returns True or False for List Head = nil
    @head == nil
  end

  def assign_initial_head(node) # => assigns head and tail variables to initial node
    @head = node
    node.link = nil
  end

  def find_tail
    return nil if list_empty?
    node = @head
    until node.link.nil?
      node = node.link
    end
    return node
  end

  def find_penultimate
    return nil if @head.link == nil
    node = @head
    until node.link.link.nil?
      node = node.link
    end
    return node
  end

  def prepend(node) # => a new node element to the beginning of the list
    if list_empty?
      assign_initial_head(node)
    else
      node.link = @head
      @head = node
    end
  end

  def append(node) # => a new node element to the end of the list
    if list_empty?
      assign_initial_head(node)
    else
      find_tail.link = node
      node.link = nil
    end
  end

  def total_node_array
    return [] if list_empty?
    node = @head
    total = []
    total << (node.data.to_s)
    until node.link.nil?
      node = node.link
      total << (node.data.to_s)
    end
    total
  end

  def count # => count the number of elements in the list
    total_node_array.count
  end

  def all # => return all elements in the linked list in order
    total_node_array.join(" ")
  end

  def includes?(data) # => gives back true or false whether the supplied value is in the list
    total_node_array.include?(data)
  end

  def pop(amount=1)
    popped = []
    amount.times do
      return nil if list_empty?
      node = @head
      if node.link.nil?
        data = @head.data
        @head = nil
      else
        data = find_tail.data
        node = find_penultimate
        node.link = nil
      end
      popped << data
    end
    popped.join(" ")
  end

  def find(position, elements)
    # find one or more elements based on arbitrary positions in the list.
    # The first parameter indicates the first position to return and
    # the second parameter specifies how many elements to return.
    # return nil if list_empty?
    @current_node = @head
    if position > 1
      (position - 1).times do
        return nil if @current_node == nil
        @current_node = @current_node.link
      end
    end
    total = []
    elements.times do
      return nil if @current_node == nil
      @current_node.data
      total << @current_node.data
      @current_node = @current_node.link
    end
    total.join(" ")
  end

  def insert(position, node)
    # insert one or more elements at an arbitrary position in the list
    @current_node = @head
    if position > 1
      (position - 1).times do
        return nil if @current_node == nil
        @current_node = @current_node.link
      end
    end
    return nil if @current_node == nil
    saved_position = @current_node.link
    @current_node.link = node
    # require 'pry'
    # binding.pry
    node.link = saved_position
  end

end

class JungleBeat

  def initialize(beats)
    @beats = beats
    node_processor(beats)
  end

  def node_processor(beats)
    linked_beats = List.new
    # require 'pry'
    # binding.pry
    submitted_beats = beats.split
    # require 'pry'
    # binding.pry
    unlinked_beats = []
    submitted_beats.each do |beat|
      beat = Node.new(beat)
      # require 'pry'
      # binding.pry
      unlinked_beats << beat
    end
    puts unlinked_beats
    unlinked_beats.each do |beat|
      linked_beats.append(beat)
    end
  end

  def play
  end

end
