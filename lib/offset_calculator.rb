require "date"
require "./lib/key_generator"

class OffsetCalculator

attr_reader :current_date,
            :current_key


  def initialize(current_date = Date.today, current_key = KeyGenerator.new.key)
    @current_date = current_date
    @current_key = current_key
  end

end
