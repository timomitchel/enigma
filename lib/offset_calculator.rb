require "date"
require_relative "key_generator"
require "yymmdd"

class OffsetCalculator

  include YYMMDD

  attr_reader :current_date,
              :current_key


  def initialize(current_date = Date.today, current_key = KeyGenerator.new.key)
    @current_date = current_date
    @current_key = current_key
  end

  def format_date_to_integer
    date_to_string.to_i
  end

  def date_to_string
   yymmdd(@current_date)
  end

  def date_squared
    (format_date_to_integer) ** 2
  end

  def grab_offset_from_date_squared
    date_squared.to_s.chars.last(4)
  end

  def offset_to_integer
    grab_offset_from_date_squared.map {|number_element| number_element.to_i}
  end


  def key_formatter
    formatted_key = []
    formatted_key << current_key[0] + current_key[1]
    formatted_key << current_key[1] + current_key[2]
    formatted_key << current_key[2] + current_key[3]
    formatted_key << current_key[3] + current_key[4]
    formatted_key
  end

  def key_to_integer
    key_formatter.map {|number| number.to_i}
  end

  def rotation_creator
    [key_to_integer, offset_to_integer].transpose.map do |both|
      both.sum
    end
  end

  def a_to_d_assignment
    rotator = {}
    rotator['A'] = rotation_creator[0]
    rotator['B'] = rotation_creator[1]
    rotator['C'] = rotation_creator[2]
    rotator['D'] = rotation_creator[3]
    rotator
  end


end
