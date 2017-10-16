class KeyGenerator

  def key
    5.times.map {rand(10)}.join
  end

end
