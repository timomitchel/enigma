require_relative 'decryptor'

class Decrypt

  def initialize
    formatted = decryptor(encrypted_message).format_decrypted_message
    decrypted_writer.write(formatted)
    puts "Created #{ARGV[1]} with the key #{ARGV[2]} and date #{ARGV[3]}"
  end

  def encrypted_message
    File.read(ARGV[0]).chomp
  end

  def decrypted_writer
    File.open(ARGV[1], 'w')
  end

  def decryptor(message)
    Decryptor.new(message, ARGV[2], ARGV[3])
  end
end

Decrypt.new
