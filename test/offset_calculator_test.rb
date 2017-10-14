require "minitest/autorun"
require "minitest/pride"
require "./lib/offset_calculator"
require "pry"

class OffsetCalculatorTest < Minitest::Test

  def test_offset_calculator_exists
    current_offset = OffsetCalculator.new

    assert_instance_of OffsetCalculator, current_offset
  end
end
