require_relative 'offset_calculator'
require_relative 'character_map'

class Encryptor

  attr_reader :message

  def initialize(message)
    @message = message.to_s
  end

  def rotation
    OffsetCalculator.new.a_to_d_assignment
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



  def character_map_indexes(characters_to_map)
        characters_to_map.map do |char|
         character_map.index(char)
    end
  end

  def index_rotator
    character_map_indexes(a_index_finder).map do |index|
      index + rotation['A']
    end
  end
end

e = Encryptor.new('Hello there I am a fabulous new message you shit')
p e.a_index_finder
p e.character_map[0..38]
p e.rotation["A"]
p e.character_map_indexes(e.a_index_finder)
p e.index_rotator
