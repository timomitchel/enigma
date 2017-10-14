require "minitest/autorun"
require "minitest/pride"
require "./lib/offset_calculator"
require "pry"

class OffsetCalculatorTest < Minitest::Test

  def test_offset_calculator_exists
    current_offset = OffsetCalculator.new

    assert_instance_of OffsetCalculator, current_offset
  end

  def test_current_date_is_instance_of_date_class
    current_offset = OffsetCalculator.new

    assert_instance_of Date, current_offset.current_date
  end

  def test_current_key_is_instance_of_string_class
    current_offset = OffsetCalculator.new

    assert_instance_of String, current_offset.current_key
  end

end
