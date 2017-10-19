require_relative 'character_map'
require_relative "offset_calculator"
require "date"

class Decryptor

  attr_reader :message, :key, :date

  def initialize(message, key, date)
    @message = message.to_s
    @key = key.to_s
    @date = date.to_s
  end

  def date_formatter
    Date.parse(date)
  end

  def offset_caller
    OffsetCalculator.new(date_formatter, key).a_to_d_assignment
  end

  def character_map
    CharacterMap.new.map
  end

  def message_splitter
    message.downcase.chars
  end

  def a_index_finder(index)
    chars_to_rotate = []
    character_collector(index, chars_to_rotate)
  end

  def b_index_finder(index)
    chars_to_rotate = []
    character_collector(index, chars_to_rotate)
  end

  def c_index_finder(index)
    chars_to_rotate = []
    character_collector(index, chars_to_rotate)
  end

  def d_index_finder(index)
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

  def offset_a
    offset_caller["A"]
  end

  def offset_b
    offset_caller["B"]
  end

  def offset_c
    offset_caller["C"]
  end

  def offset_d
    offset_caller["D"]
  end

  def character_map_indexes(characters_to_map)
      characters_to_map.map do |char|
        character_map.index(char)
    end
  end

  def neg_a_rotator
    character_map_indexes(a_index_finder(0)).map do |index|
      rotated = character_map.rotate((offset_a * -1))
      rotated[index]
    end
  end

  def neg_b_rotator
    character_map_indexes(b_index_finder(1)).map do |index|
      rotated = character_map.rotate((offset_b * -1))
      rotated[index]
    end
  end

  def neg_c_rotator
    character_map_indexes(c_index_finder(2)).map do |index|
      rotated = character_map.rotate((offset_c * -1))
      rotated[index]
    end
  end

  def neg_d_rotator
    character_map_indexes(d_index_finder(3)).map do |index|
      rotated = character_map.rotate((offset_d * -1))
      rotated[index]
    end
  end

  def zip_rotated_characters
    neg_a_rotator.zip(neg_b_rotator, neg_c_rotator, neg_d_rotator)
  end

  def format_decrypted_message
    zip_rotated_characters.compact.join
  end
end
