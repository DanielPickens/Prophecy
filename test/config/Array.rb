require_relative "../test_helper"

class ArrayTest < Minitest::Test
  def test_array_sums_correctly
    assert_equal 10, [1,2,3,4].sum
  end
end
