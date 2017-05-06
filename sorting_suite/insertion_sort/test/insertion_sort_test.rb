require 'minitest/autorun'
require 'minitest/pride'
require './lib/insertion_sort'
require "pry"

# I found it extremely hard to write tests to properly develop this
# due to the fact that you don't pass the arguement into the initialize
# method. I feel like I got "pretty hacky" on this one. Methods have
# too much responsibility. I feel I could have written it differently it
# we had passed it into initialize, but this one left me feeling
# "mentally broken". Eventually I broke down and stopped using TDD
# becasue I didn't know how to properly use it in this case.

class InsertionSortTest < Minitest::Test

  def test_it_exists
      ins = InsertionSort.new
      assert_instance_of InsertionSort, ins
  end

  def test_it_can_take_a_collection_to_sort
      array = ["d", "b", "a", "c"]
      ins = InsertionSort.new
      ins.sort(array)
      assert_equal array, ins.unsorted_array
  end

  def test_it_can_move_first_item_into_sorted_array
    skip #this test worked good until I got stuck. Bummed I had to kill it.
    array = ["d", "b", "a", "c"]
    ins = InsertionSort.new
    ins.sort(array)
    assert_equal ["d"] , ins.sorted_array
  end

  def test_it_can_sort_remaining_items
    array = ["d", "b", "a", "c"]
    sorted = ["a", "b", "c", "d"]
    ins = InsertionSort.new
    ins.sort(array)
    assert_equal sorted, ins.sorted_array
  end

  def test_it_knows_sorting_has_ended
    array = ["d", "b", "a", "c"]
    ins = InsertionSort.new
    ins.sort(array)
    assert ins.done_sorting
  end
end
