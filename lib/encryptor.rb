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

  def offset_a
    offset["B"]
  end

  def offset_a
    offset["C"]
  end

  def offset_a
    offset["D"]
  end

  def index_rotator_a
    character_map_indexes(a_index_finder).map do |index|
      index + offset_a
    end
  end

  def index_rotator_b
    character_map_indexes(b_index_finder).map do |index|
      index + offset_b
    end
  end

  def index_rotator_c
    character_map_indexes(c_index_finder).map do |index|
      index + offset_c
    end
  end

  def index_rotator_d
    character_map_indexes(d_index_finder).map do |index|
      index + offset_d
    end
  end

end

e = Encryptor.new('Hello there I am a fabulous new message you shit')
p e.a_index_finder
p e.character_map[0..38]
p e.character_map_indexes(e.a_index_finder)
p e.index_rotator_a
