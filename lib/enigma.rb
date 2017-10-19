require_relative 'key_generator'
require_relative 'encryptor'
require_relative 'decryptor'


class Enigma

  attr_reader :encryptor

  def encrypt(message, key = encryptor.offset.current_key, date = Date.today)
    @encryptor = Encryptor.new(message, key, date)
    p "#{encryptor.format_encrypted_message}"
  end

  def decrypt(message, key, date = Date.today)
    decryptor = Decryptor.new(message, key, date)
    p "#{decryptor.format_decrypted_message}"
  end
end
