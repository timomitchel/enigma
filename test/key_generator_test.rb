require "minitest/autorun"
require "minitest/pride"
require "./lib/key_generator"
require "pry"

class KeyGeneratorTest < Minitest::Test

  def test_key_generator_exists
    current_key = KeyGenerator.new

    assert_instance_of KeyGenerator, current_key

  end

end
