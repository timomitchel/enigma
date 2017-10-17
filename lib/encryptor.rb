require_relative 'offset_calculator'
require_relative 'character_map'

class Encryptor

  attr_reader :message, :offset

  def initialize(message)
    @message = message.to_s
    @offset = OffsetCalculator.new.a_to_d_assignment
  end

  def character_map
    CharacterMap.new.map
  end

  def message_splitter
    @message.downcase.chars
  end

  def a_index_finder
    index = 0
    chars_to_rotate = []
    character_collector(index, chars_to_rotate)
  end

  def b_index_finder
    index = 1
    chars_to_rotate = []
    character_collector(index, chars_to_rotate)
  end

  def c_index_finder
    index = 2
    chars_to_rotate = []
    character_collector(index, chars_to_rotate)
  end

  def d_index_finder
    index = 3
    chars_to_rotate = []
    character_collector(index, chars_to_rotate)
  end

  def character_collector(index, chars_to_rotate)
      while index < message_splitter.length
        chars_to_rotate << message_splitter[index]
        index += 4
      end
      chars_to_rotate
  end

  def character_map_indexes(characters_to_map)
      characters_to_map.map do |char|
        character_map.index(char)
    end
  end

  def offset_a
    offset["A"]
  end

  def offset_b
    offset["B"]
  end

  def offset_c
    offset["C"]
  end

  def offset_d
    offset["D"]
  end

  def a_rotator
    character_map_indexes(a_index_finder).map do |index|
      rotated = character_map.rotate(offset_a)
      rotated[index]
    end
  end

  def b_rotator
    character_map_indexes(b_index_finder).map do |index|
      rotated = character_map.rotate(offset_b)
      rotated[index]
    end
  end

  def c_rotator
    character_map_indexes(c_index_finder).map do |index|
      rotated = character_map.rotate(offset_c)
      rotated[index]
    end
  end

  def d_rotator
    character_map_indexes(d_index_finder).map do |index|
      rotated = character_map.rotate(offset_d)
      rotated[index]
    end
  end

  def zip_rotated_characters
    a_rotator.zip(b_rotator, c_rotator, d_rotator)
  end

  def format_encrypted_message
    zip_rotated_characters.compact.join
  end
end

e = Encryptor.new('Hello there I am a fabulous')
p e.a_index_finder
p e.character_map
p e.character_map_indexes(e.a_index_finder)
p e.a_rotator
p e.b_rotator
p e.c_rotator
p e.d_rotator
p e.zip_rotated_characters
p e.format_encrypted_message
