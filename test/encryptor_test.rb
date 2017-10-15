require "minitest/autorun"
require "minitest/pride"
require "./lib/encryptor"

class EncryptorTest < Minitest::Test

  def test_encryptor_class_exists
    encryptor = Encryptor.new("holy shit")

    assert_instance_of Encryptor, encryptor
  end

  def test_initialize_holds_correct_objects
    encryptor = Encryptor.new("holy shit")

    assert_equal "holy shit", encryptor.message
  end

  def test_

  end


end
