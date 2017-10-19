require "minitest/autorun"
require "minitest/pride"
require "./lib/decryptor"


class DecryptorTest < Minitest::Test

  def test_exists_and_has_attributes
    decrypt = Decryptor.new('hi', '24238', 171017)

    assert_instance_of Decryptor, decrypt
    assert_equal 'hi', decrypt.message
    assert_equal '24238', decrypt.key
    assert_equal '171017', decrypt.date
  end

  # def test_date_formatter_returns_date_object
  #   decrypt = Decryptor.new('helllo', 24238, '171088')
  #
  #   assert_equal '', decrypt.date_formatter
  # end

  def test_offset_calculator_holds_offset_object_with_date_and_key
    decrypt = Decryptor.new('hi', '24238', 071017)

    assert_instance_of OffsetCalculator, decrypt.offset_calculator
    assert_instance_of Date, decrypt.offset_calculator.current_date
    assert_equal '24238', decrypt.offset_calculator.current_key
  end

  def test_offset_caller_returns_hash_with_offsets
    decrypt = Decryptor.new('hi', '24238', 071017)

    assert_instance_of Hash, decrypt.offset_caller
    assert_equal [25, 46, 27, 39], decrypt.offset_caller.values
  end

  def test_character_map_loads_correctly
    decrypt = Decryptor.new('hi', '24238', 071017)

    assert_instance_of Array, decrypt.character_map
    assert_equal 'a', decrypt.character_map[0]
    assert_equal ',', decrypt.character_map[38]
  end

  def test_message_splitter
    decrypt = Decryptor.new(['hi'], 24238, 071017)
    expected = ["[", "\"", "h", "i", "\"", "]"]

    assert_instance_of Array, decrypt.message_splitter
    assert_equal expected, decrypt.message_splitter
  end

  def test_a_index_finder
    decrypt = Decryptor.new('halp', '24238', "071017")

    assert_instance_of Array, decrypt.a_index_finder(0)
    assert_equal 'h', decrypt.a_index_finder(0).first
  end

  def test_b_index_finder
    decrypt = Decryptor.new('halp', '24238', "071017")

    assert_instance_of Array, decrypt.b_index_finder(1)
    assert_equal ['a'], decrypt.b_index_finder(1)
  end

  def test_c_index_finder
    decrypt = Decryptor.new('halp me plaze', '24238', "071017")

    assert_instance_of Array, decrypt.c_index_finder(2)
    assert_equal ["l", "e", "a"], decrypt.c_index_finder(2)
  end

  def test_d_index_finder
    decrypt = Decryptor.new('halp me plaze', '24238', "071017")

    assert_instance_of Array, decrypt.d_index_finder(3)
    assert_equal ["p", " ", "z"], decrypt.d_index_finder(3)
  end

  def test_character_collector
    decrypt = Decryptor.new('halp me plaze', '24238', "071017")

    assert_instance_of Array, decrypt.character_collector(1, [])
    assert_equal decrypt.b_index_finder(1), decrypt.character_collector(1, [])
  end

  def test_offset_a
    decrypt = Decryptor.new('halp me plaze', '24238', "071017")

    assert_instance_of Integer, decrypt.offset_a
    assert_equal 28, decrypt.offset_a
  end

  def test_offset_b
    decrypt = Decryptor.new('halp me plaze', '24238', "071017")

    assert_instance_of Integer, decrypt.offset_b
    assert_equal 42, decrypt.offset_b
  end

  def test_offset_c
    decrypt = Decryptor.new('halp me plaze', '24238', "071017")

    assert_instance_of Integer, decrypt.offset_c
    assert_equal 27, decrypt.offset_c
  end

  def test_offset_d
    decrypt = Decryptor.new('halp me plaze', '24238', "071017")

    assert_instance_of Integer, decrypt.offset_d
    assert_equal 47, decrypt.offset_d
  end

  def test_case_name

  end

end
