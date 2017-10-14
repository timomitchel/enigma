require "date"
require "./lib/key_generator"
require "pry"
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
   ddmmyy(@current_date)
  end

  def date_squared
    (format_date_to_integer) ** 2
  end

  def grab_offset_from_date_squared
    date_squared.to_s.chars.last(4)
  end

end

off = OffsetCalculator.new
p off.format_date_to_integer
