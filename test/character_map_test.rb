require "minitest/autorun"
require "minitest/pride"
require "./lib/character_map"

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



end
