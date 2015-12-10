require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'jungle_edit'

class ListTest < Minitest::Test

  def test_initialize_with_nil_head?
    # default Head = nil
    linked_list = List.new

    assert_nil linked_list.head
  end

  def test_one_node_list_has_head?
    # appending 1 Node creates Head
    linked_list = List.new
    node_1 = Node.new(0)
    linked_list.prepend(node_1)

    assert_equal node_1, linked_list.head
    refute_nil linked_list.head
  end

  def test_two_node_list_has_head?
    # default Head w/ 2 Nodes
    linked_list = List.new
    node_1 = Node.new(0)
    linked_list.prepend(node_1)
    node_2 = Node.new(1)
    linked_list.prepend(node_2)

    assert_equal node_2, linked_list.head
    refute_equal node_1, linked_list.head
    refute_nil linked_list.head
  end

  def test_initialize_with_nil_tail?
    # default Tail = nil
    linked_list = List.new

    assert_nil linked_list.find_tail
  end

  def test_one_node_list_has_tail?
    # appending 1 Node creates Tail
    linked_list = List.new
    node_1 = Node.new(0)
    linked_list.prepend(node_1)

    assert_equal node_1, linked_list.find_tail
    refute_nil linked_list.find_tail
  end

  def test_two_node_list_has_tail?
    # appending 2 Nodes creates Tail
    linked_list = List.new
    node_2 = Node.new("two")
    node_1 = Node.new("one")
    linked_list.prepend(node_1)
    linked_list.append(node_2)

    assert_equal node_2, linked_list.find_tail
    refute_equal node_1, linked_list.find_tail
    refute_nil linked_list.find_tail
  end

  def test_three_node_list_has_tail?
    linked_list = List.new
    node_2 = Node.new("two")
    node_1 = Node.new("one")
    node_3 = Node.new("three")
    linked_list.prepend(node_1)
    linked_list.append(node_2)
    linked_list.append(node_3)

    assert_equal node_3, linked_list.find_tail
    refute_equal node_1, linked_list.find_tail
    refute_equal node_2, linked_list.find_tail
    refute_nil linked_list.find_tail
  end

  def test_one_node_list_find_penultimate
    linked_list = List.new
    node_1 = Node.new("one")
    linked_list.append(node_1)

    assert_nil linked_list.find_penultimate
  end

  def test_two_node_list_find_penultimate
    linked_list = List.new
    node_1 = Node.new("one")
    node_2 = Node.new("two")
    linked_list.append(node_1)
    linked_list.append(node_2)

    assert_equal node_1, linked_list.find_penultimate
  end

  def test_three_node_list_find_penultimate
    linked_list = List.new
    node_1 = Node.new("one")
    node_2 = Node.new("two")
    node_3 = Node.new("three")
    linked_list.prepend(node_1)
    linked_list.append(node_2)
    linked_list.append(node_3)

    assert_equal node_2, linked_list.find_penultimate
  end

  def test_empty_list_count
    linked_list = List.new

    assert_equal 0, linked_list.count
  end

  def test_one_node_list_count
    linked_list = List.new
    node_1 = Node.new("one")
    linked_list.append(node_1)

    assert_equal 1, linked_list.count
    refute_nil linked_list.count
    refute_equal 0, linked_list.count
  end

  def test_two_node_list_count
    linked_list = List.new
    node_1 = Node.new("one")
    node_2 = Node.new("two")
    linked_list.prepend(node_1)
    linked_list.append(node_2)

    assert_equal 2, linked_list.count
    refute_nil linked_list.count
    refute_equal 1, linked_list.count
  end

  def test_three_node_list_count
    linked_list = List.new
    node_1 = Node.new("one")
    node_2 = Node.new("two")
    node_3 = Node.new("three")
    linked_list.prepend(node_1)
    linked_list.append(node_2)
    linked_list.append(node_3)

    assert_equal 3, linked_list.count
    refute_nil linked_list.count
    refute_equal 2, linked_list.count
  end

  def test_empty_list_all
    linked_list = List.new

    assert_equal "", linked_list.all
  end

  def test_one_node_list_all
    # skip
    linked_list = List.new
    node_1 = Node.new("one")
    linked_list.prepend(node_1)

    assert_equal "one", linked_list.all
    refute_equal "", linked_list.all
    refute_nil linked_list.all
  end

  def test_two_node_list_all
    # skip
    linked_list = List.new
    node_1 = Node.new("one")
    node_2 = Node.new("two")
    linked_list.prepend(node_1)
    linked_list.append(node_2)

    assert_equal "one two", linked_list.all
    refute_equal "two", linked_list.all
    refute_equal "one", linked_list.all
    refute_nil linked_list.all
  end

  def test_empty_list_includes?
    # skip
    linked_list = List.new
    assert_equal false, linked_list.includes?("one")
    refute_equal true, linked_list.includes?("one")
  end

  def test_one_node_list_includes?
    # skip
    linked_list = List.new
    node_1 = Node.new("one")
    linked_list.prepend(node_1)
    assert_equal true, linked_list.includes?("one")
    refute_equal false, linked_list.includes?("one")
    refute_nil linked_list.includes?("one")
  end

  def test_two_node_list_includes?
    # skip
    linked_list = List.new
    node_1 = Node.new("one")
    node_2 = Node.new("two")
    linked_list.prepend(node_1)
    linked_list.append(node_2)
    assert_equal true, linked_list.includes?("one")
    assert_equal true, linked_list.includes?("two")
  end

  def test_empty_list_pop
    # skip
    linked_list = List.new
    assert_nil = linked_list.pop
    assert_nil = linked_list.pop(1)
    assert_nil = linked_list.pop(2)
    assert_nil = linked_list.pop(15)
  end

  def test_one_node_list_pop
    linked_list = List.new
    node_1 = Node.new("one")
    linked_list.prepend(node_1)
    popped = linked_list.pop

    assert_equal node_1.data, popped
    assert_equal 0, linked_list.count
    assert_equal "", linked_list.all
  end

  def test_two_node_list_pop
    linked_list = List.new
    node_1 = Node.new("one")
    node_2 = Node.new("two")
    linked_list.prepend(node_1)
    linked_list.append(node_2)
    popped = linked_list.pop

    assert_equal node_2.data, popped
    assert_equal 1, linked_list.count
    assert_equal node_1, linked_list.find_tail
  end

  def test_three_node_list_pop
    linked_list = List.new
    node_1 = Node.new("one")
    node_2 = Node.new("two")
    node_3 = Node.new("three")
    linked_list.prepend(node_1)
    linked_list.append(node_2)
    linked_list.append(node_3)
    popped = linked_list.pop

    assert_equal node_3.data, popped
    assert_equal 2, linked_list.count
    assert_equal node_2, linked_list.find_tail
  end

  def test_three_node_list_pop_two
    linked_list = List.new
    node_1 = Node.new("one")
    node_2 = Node.new("two")
    node_3 = Node.new("three")
    linked_list.prepend(node_1)
    linked_list.append(node_2)
    linked_list.append(node_3)
    popped_twice = linked_list.pop(2)

    assert_equal "three two", popped_twice
    assert_equal 1, linked_list.count
    assert_equal node_1, linked_list.find_tail
  end

  def test_three_node_list_pop_all
    # skip
    linked_list = List.new
    node_1 = Node.new("one")
    node_2 = Node.new("two")
    node_3 = Node.new("three")
    linked_list.prepend(node_1)
    linked_list.append(node_2)
    linked_list.append(node_3)
    popped_thrice = linked_list.pop(3)

    assert_equal "three two one", popped_thrice
    assert_equal 0, linked_list.count
    assert_nil linked_list.find_tail
  end

  def test_empty_list_find
    linked_list = List.new

    assert_nil linked_list.find(1, 1)
    assert_nil linked_list.find(0, 1)
  end

  def test_one_node_list_find
    linked_list = List.new
    node_1 = Node.new("one")
    linked_list.prepend(node_1)

    assert_equal "one", linked_list.find(1, 1)
  end

  def test_two_node_list_find
    linked_list = List.new
    node_1 = Node.new("one")
    node_2 = Node.new("two")
    linked_list.prepend(node_1)
    linked_list.append(node_2)

    assert_equal "two", linked_list.find(2, 1)
    assert_equal "one two", linked_list.find(1, 2)
    assert_equal "", linked_list.find(1, 0)
    assert_equal "", linked_list.find(2, 0)
    assert_nil linked_list.find(5, 0)
    assert_nil linked_list.find(12, 12)
  end

  def test_three_node_list_find
    linked_list = List.new
    node_1 = Node.new("one")
    node_2 = Node.new("two")
    node_3 = Node.new("three")
    linked_list.prepend(node_1)
    linked_list.append(node_2)
    linked_list.append(node_3)

    assert_equal "three", linked_list.find(3, 1)
    assert_equal "one two three", linked_list.find(1, 3)
    assert_equal "one two", linked_list.find(1, 2)
    assert_nil linked_list.find(1, 5)
  end

  def test_one_node_list_insert
    # => insert one or more elements at an arbitrary position in the list
    linked_list = List.new
    node_1 = Node.new("one")
    node_2 = Node.new("two")
    linked_list.prepend(node_1)
    linked_list.insert(1, node_2)

    assert_equal 2, linked_list.count
    assert_equal node_2, linked_list.find_tail
    assert_equal true, linked_list.includes?("two")
  end

  def test_one_node_list_insert_beyond
    linked_list = List.new
    node_1 = Node.new("one")
    node_2 = Node.new("two")
    linked_list.prepend(node_1)
    too_far = linked_list.insert(4, node_2)

    assert_nil too_far
  end

  def test_two_node_list_insert
    # skip
    linked_list = List.new
    node_1 = Node.new("one")
    node_2 = Node.new("two")
    node_3 = Node.new("three")
    linked_list.prepend(node_1)
    linked_list.append(node_2)
    linked_list.insert(2, node_3)

    assert_equal 3, linked_list.count
    assert_equal node_3, linked_list.find_tail
    assert_equal true, linked_list.includes?("three")
  end

  def test_one_node_list_insert_two
    skip
    linked_list = List.new
    node_1 = Node.new("one")
    node_2 = Node.new("two")
    node_3 = Node.new("three")
    linked_list.prepend(node_1)
    linked_list.insert(1, node_2)

    assert_equal 3, linked_list.count
    assert_equal node_3, linked_list.find_tail
    assert_equal true, linked_list.includes?("two")
  end

end

class JungleBeatTest < Minitest::Test

  def test_node_processor
    linked_beats = JungleBeat.new("test_1 test_2")
    linked_beats.node_processor("test_1 test_2")
    # require 'pry'
    # binding.pry

    assert_equal 3, linked_beats.count
  end

  def test_play
    skip
  end

end
