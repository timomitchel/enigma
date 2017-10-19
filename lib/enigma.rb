require_relative 'key_generator'
require_relative 'encryptor'
require_relative 'decryptor'
require "pry"

class Enigma

  def encrypt(message, key = KeyGenerator.new.key, date = Date.today)
    encryptor = Encryptor.new(message)
    p "#{encryptor.format_encrypted_message}"
  end

  def decrypt(message, key, date = Date.today)
    decryptor = Decryptor.new(message, key, date)
    p "#{decryptor.format_decrypted_message}"
  end
end

e = Enigma.new
e.encrypt('this is so secret ..end..', '12345', Date.today)
e.decrypt("nt,db909yep9bx.8enxflajhj", '12345')
