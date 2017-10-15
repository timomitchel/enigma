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

  def test_rotation_returns_a_hash
    encryptor = Encryptor.new("holy shit")

    assert_instance_of Hash, encryptor.rotation
  end

  def test_rotation_has_A_B_C_D_keys
    encryptor = Encryptor.new(75)

    assert_equal ["A","B","C","D"], encryptor.rotation.keys
  end

  def test_character_map_is_array
    encryptor = Encryptor.new(["holy shit", 75])

    assert_instance_of Array, encryptor.character_map
  end

  def test_message_can_be_an_array
    encryptor = Encryptor.new(["holy shit", 75])

    assert_equal '["holy shit", 75]', encryptor.message
  end

  def test_message_splitter_returns_array_of_characters
    message = "adskjbflaksj. dgn,akgdn asf298475937"
    encryptor = Encryptor.new(message)

    assert_instance_of Array, encryptor.message_splitter
    assert_equal message[0], encryptor.message_splitter[0]
    assert_equal message[15], encryptor.message_splitter[15]
    assert_equal message[-7], encryptor.message_splitter[-7]
  end


end
