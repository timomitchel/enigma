require_relative "encryptor"
require "pry"

class Encrypted

  def initialize
    message = File.read(ARGV[0])
    encrypted_writer = File.open(ARGV[1], 'w')
    encryptor_class = Encryptor.new(message)
    encrypted_message = encryptor_class.format_encrypted_message
    encrypted_writer.write(encrypted_message)
    puts "Created #{ARGV[1]} with the key #{encryptor_class.offset.current_key} and date #{encryptor_class.offset.current_date}"
  end

end

Encrypted.new
