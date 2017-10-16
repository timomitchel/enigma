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

    assert_instance_of Hash, encryptor.offset
  end

  def test_rotation_has_A_B_C_D_keys
    encryptor = Encryptor.new(75)

    assert_equal ["A","B","C","D"], encryptor.offset.keys
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

  def test_a_index_finder_returns_array
    encryptor = Encryptor.new("some string")

    assert_instance_of Array, encryptor.a_index_finder
  end

  def test_a_index_finder_returns_correct_length_and_correct_character
    encryptor = Encryptor.new("some")

    assert_equal "s", encryptor.a_index_finder[0]
    assert_equal 1, encryptor.a_index_finder.length
  end

  def test_a_index_finder_returns_correctly_for_longer_string
    encryptor = Encryptor.new("some string with 12/15/17")
    expected = ["s", " ", "i", "w", " ", "1", "7"]

    assert_equal 7, encryptor.a_index_finder.length
    assert_equal " ", encryptor.a_index_finder[1]
    assert_equal expected, encryptor.a_index_finder
  end

  def test_b_index_finder_returns_array
    encryptor = Encryptor.new("some string")

    assert_instance_of Array, encryptor.b_index_finder
  end

  def test_b_index_finder_returns_correct_length_and_correct_character
    encryptor = Encryptor.new("some")

    assert_equal "o", encryptor.b_index_finder[0]
    assert_equal 1, encryptor.b_index_finder.length
  end

  def test_b_index_finder_returns_correctly_for_longer_string
    encryptor = Encryptor.new("some string with 12/15/17")
    expected = ["o", "s", "n", "i", "1", "5"]

    assert_equal 6, encryptor.b_index_finder.length
    assert_equal "n", encryptor.b_index_finder[2]
    assert_equal expected, encryptor.b_index_finder
  end

  def test_c_index_finder_returns_array
    encryptor = Encryptor.new("some string")

    assert_instance_of Array, encryptor.c_index_finder
  end

  def test_c_index_finder_returns_correct_length_and_correct_character
    encryptor = Encryptor.new("some")

    assert_equal "m", encryptor.c_index_finder[0]
    assert_equal 1, encryptor.c_index_finder.length
  end

  def test_c_index_finder_returns_correctly_for_longer_string
    encryptor = Encryptor.new("some string with 12/15/17")
    expected = ["m", "t", "g", "t", "2", "/"]

    assert_equal 6, encryptor.c_index_finder.length
    assert_equal "g", encryptor.c_index_finder[2]
    assert_equal expected, encryptor.c_index_finder
  end


  def test_d_index_finder_returns_array
    encryptor = Encryptor.new("some string")

    assert_instance_of Array, encryptor.d_index_finder
  end

  def test_d_index_finder_returns_correct_length_and_correct_character
    encryptor = Encryptor.new("some")

    assert_equal "e", encryptor.d_index_finder[0]
    assert_equal 1, encryptor.d_index_finder.length
  end

  def test_d_index_finder_returns_correctly_for_longer_string
    encryptor = Encryptor.new("some string with 12/15/17")
    expected = ["e", "r", " ", "h", "/", "1"]

    assert_equal 6, encryptor.d_index_finder.length
    assert_equal " ", encryptor.d_index_finder[2]
    assert_equal expected, encryptor.d_index_finder
  end

  def test_character_collector_returns_array
    encryptor = Encryptor.new("some string")

    assert_instance_of Array, encryptor.character_collector(0,[])
  end

  def test_character_map_indexes_returns_array
    encryptor = Encryptor.new("some string")
    actual = encryptor.character_map_indexes(encryptor.a_index_finder)
    assert_instance_of Array, actual
  end

  def test_character_map_index_a_returns_integers_at_index_position_on_char_map
    encryptor = Encryptor.new("some string")
    actual = encryptor.character_map_indexes(encryptor.a_index_finder)
    expected_1 = encryptor.character_map.index('s')
    expected_2 = encryptor.character_map.index(' ')
    expected_3 = encryptor.character_map.index('i')

    assert_equal expected_1, actual[0]
    assert_equal expected_2, actual[1]
    assert_equal expected_3, actual[2]
  end

  def test_character_map_index_b_returns_integers_at_index_position_on_char_map
    encryptor = Encryptor.new("some string")
    actual = encryptor.character_map_indexes(encryptor.b_index_finder)
    expected_1 = encryptor.character_map.index('o')
    expected_2 = encryptor.character_map.index('s')
    expected_3 = encryptor.character_map.index('n')

    assert_equal expected_1, actual[0]
    assert_equal expected_2, actual[1]
    assert_equal expected_3, actual[2]
  end

  def test_character_map_index_c_returns_integers_at_index_position_on_char_map
    encryptor = Encryptor.new("some string")
    actual = encryptor.character_map_indexes(encryptor.c_index_finder)
    expected_1 = encryptor.character_map.index('m')
    expected_2 = encryptor.character_map.index('t')
    expected_3 = encryptor.character_map.index('g')

    assert_equal expected_1, actual[0]
    assert_equal expected_2, actual[1]
    assert_equal expected_3, actual[2]
  end

  def test_character_map_index_d_returns_integers_at_index_position_on_char_map
    encryptor = Encryptor.new("some string")
    actual = encryptor.character_map_indexes(encryptor.d_index_finder)
    expected_1 = encryptor.character_map.index('e')
    expected_2 = encryptor.character_map.index('r')

    assert_equal expected_1, actual[0]
    assert_equal expected_2, actual[1]
    assert_nil nil, actual[2]
  end

  def test_offset_a_returns_an_integer
    encryptor = Encryptor.new("some string")

    assert_instance_of Integer, encryptor.offset_a
  end

  def test_offset_b_returns_an_integer
    encryptor = Encryptor.new("some string")

    assert_instance_of Integer, encryptor.offset_b
  end

  def test_offset_c_returns_an_integer
    encryptor = Encryptor.new("some string")

    assert_instance_of Integer, encryptor.offset_c
  end

  def test_offset_d_returns_an_integer
    encryptor = Encryptor.new("some string")

    assert_instance_of Integer, encryptor.offset_d
  end


end
