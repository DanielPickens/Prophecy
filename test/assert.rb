require_relative "../test_helper"

class AssertTest < Minitest::Test
  def test_assert_array_sums_correctly
    assert_equal 10, [1,2,3,4].sum
  end
end