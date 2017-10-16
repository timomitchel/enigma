class CharacterMap

  attr_reader :map

  def initialize
    @map = character_map
  end

  def character_map
  character_map = ('a'..'z').to_a + ('0'..'9').to_a
  character_map << " "
  character_map << "."
  character_map << ","
  end
end
