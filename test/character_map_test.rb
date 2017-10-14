require "minitest/autorun"
require "minitest/pride"
require "./lib/character_map"
require "pry"

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

  def test_index_0_and_index_39_return_the_a_character
    assert_equal 'a', character_map.map[0]
    assert_equal 'a', character_map.map[39]
    assert_equal 'a', character_map.map[39+39+39]
  end

  def test_commas_are_at_index_we_expect
    assert_equal ',', character_map.map[38]
    assert_equal ',', character_map.map[77]
    assert_equal ',', character_map.map[77+39]
    assert_equal ',', character_map.map[77+39+39]
  end

  def test_character_map_method_returns_array
    assert_equal 'b', character_map.character_map[1]
    assert_equal 'b', character_map.character_map[1+39]
    assert_equal 'b', character_map.character_map[1+39+39]
  end

  def test_space_character_returned_from_array_at_correct_index
    assert_equal ' ', character_map.map[36]
    
  end

end
