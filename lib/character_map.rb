require "pry"

class CharacterMap
  partial_map = ('a'..'z').to_a + ('0'..'9').to_a
  partial_map << " "
  partial_map << "."
  partial_map << ","
  character_map = partial_map * 4
end
