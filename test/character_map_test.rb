require "minitest/autorun"
require "minitest/pride"
require "./lib/character_map"
require_relative "test_helper"

class CharacterMapTest < Minitest::Test

  attr_reader :character_map

  def setup
    @character_map = CharacterMap.new
  end

  def test_the_class_exists
    assert_instance_of CharacterMap, character_map
  end

  def test_map_function_returns_array
    assert_instance_of Array, character_map.map
  end

  def test_index_0
    assert_equal 'a', character_map.map[0]
  end

  def test_commas_are_at_index_we_expect
    assert_equal ',', character_map.map[38]
  end

  def test_character_map_method_returns_correct_b_index
    assert_equal 'b', character_map.map[1]
  end

  def test_space_character_returned_from_array_at_correct_index
    assert_equal ' ', character_map.map[36]
  end

  def test_character_map_length_is_39
    assert_equal 39, character_map.map.length
  end

end
