require "pry"

class InsertionSort
attr_reader :unsorted_array, :sorted_array, :current_item, :done_sorting

  def initialize
    @unsorted_array = []
    @sorted_array = []
    @current_item = []
    @index_of_insert = []
    @done_sorting = false
  end

  def sort(input_data)
    @unsorted_array = input_data
    deliver_first_item
    sort_remaining_items
  end

  def deliver_first_item
    @current_item = @unsorted_array.shift
    @sorted_array << @current_item
  end

  def sort_remaining_items
    until @done_sorting
      @current_item = @unsorted_array.shift
      @sorted_array.each_with_index do |sorted_item, index_of_item|
        if @current_item < sorted_item
          @index_of_insert = index_of_item
          break
        else
          @index_of_insert = -1
        end
      end
      @sorted_array.insert(@index_of_insert, @current_item)
      @done_sorting = true if @unsorted_array == []
    end
  end
end

ins = InsertionSort.new
ins.sort(["d", "b", "a", "c"])
