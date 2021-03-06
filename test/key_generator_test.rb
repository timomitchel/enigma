require "minitest/autorun"
require "minitest/pride"
require "./lib/key_generator"
require_relative "test_helper"

class KeyGeneratorTest < Minitest::Test

  def test_key_generator_exists
    current_key = KeyGenerator.new

    assert_instance_of KeyGenerator, current_key
  end

  def test_random_key_generated_has_5_digits
    current_key = KeyGenerator.new

    assert_equal 5, current_key.key.length
  end

  def test_random_key_generated_includes_digits_0_to_9
    current_key = KeyGenerator.new
    digits = [0,1,2,3,4,5,6,7,8,9]

    assert digits.any?{|digit| digit = current_key.key[4].to_i}
    assert digits.any?{|digit| digit = current_key.key[3].to_i}
    assert digits.any?{|digit| digit = current_key.key[2].to_i}
    assert digits.any?{|digit| digit = current_key.key[1].to_i}
    assert digits.any?{|digit| digit = current_key.key[0].to_i}
  end

  def test_key_generator_edge_case
    current_key = KeyGenerator.new
    digits = [0,1,2,3,4,5,6,7,8,9]

    assert_nil nil, digits.any?{|digit| digit = current_key.key[5].to_i}
  end

end
