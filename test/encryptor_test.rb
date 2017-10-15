require "minitest/autorun"
require "minitest/pride"
require "./lib/encryptor"

class EncryptorTest < Minitest::Test

  def test_encryptor_class_exists
    encryptor = Encryptor.new

    assert_instance_of Encryptor, encryptor
  end

  def test_initialize_holds_correct_objects
    encryptor = Encryptor.new

    assert_equal '', encryptor.key
    assert_equal '', encryptor.character_map
    assert_equal '', encryptor.date
  end

  def test_

  end


end
