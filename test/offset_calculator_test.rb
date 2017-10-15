require "minitest/autorun"
require "minitest/pride"
require "./lib/offset_calculator"
require "yymmdd"
require "pry"

class OffsetCalculatorTest < Minitest::Test

  include YYMMDD

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

  def test_format_date_to_string
    current_offset = OffsetCalculator.new

    assert_equal ddmmyy(Date.today), current_offset.date_to_string
  end

  def test_format_date_to_integer
    current_offset = OffsetCalculator.new

    assert_equal ddmmyy(Date.today).to_i, current_offset.format_date_to_integer
  end

  def test_date_squared
    current_offset = OffsetCalculator.new
    actual = (current_offset.format_date_to_integer) ** 2
    expected = current_offset.date_squared

    assert_equal expected, actual
  end

  def test_grab_offset_from_date_squared
    current_offset = OffsetCalculator.new
    actual = ((ddmmyy(Date.today).to_i) ** 2).to_s.chars.last(4)
    expected = current_offset.grab_offset_from_date_squared

    assert_equal expected, actual
  end

  def test_key_formatter_returns_array
    current_offset = OffsetCalculator.new

    assert_instance_of Array, current_offset.key_formatter
  end

  def test_key_to_integer
    current_offset = OffsetCalculator.new

    assert_instance_of Integer, current_offset.key_to_integer[0]
    assert_instance_of Integer, current_offset.key_to_integer[1]
    assert_instance_of Integer, current_offset.key_to_integer[2]
    assert_instance_of Integer, current_offset.key_to_integer[3]
    assert_instance_of Array, current_offset.key_to_integer
  end

  def test_rotation_creator
    current_offset = OffsetCalculator.new

    assert_instance_of Array, current_offset.rotation_creator
  end

  def test_rotation_is_summed_correctly
    current_offset = OffsetCalculator.new
    key = current_offset.key_to_integer
    offset = current_offset.offset_to_integer

    assert_equal key + offset, current_offset.rotation_creator
  end

  def test_a_to_d_assignment
    current_offset = OffsetCalculator.new

    assert_instance_of Hash, current_offset.a_to_d_assignment
    assert_instance_of Integer, current_offset.a_to_d_assignment['A']
    assert_instance_of Integer, current_offset.a_to_d_assignment['B']
    assert_instance_of Integer, current_offset.a_to_d_assignment['C']
    assert_instance_of Integer, current_offset.a_to_d_assignment['D']
    assert_equal ["A", "B", "C", "D"], current_offset.a_to_d_assignment.keys
  end

end
