require_relative "encryptor"
require "pry"
require 'yymmdd'

class Encrypt

  include YYMMDD

  def initialize
    message = File.read(ARGV[0])
    encrypted_writer = File.open(ARGV[1], 'w')
    encryptor_class = Encryptor.new(message)
    encrypted_message = encryptor_class.format_encrypted_message
    encrypted_writer.write(encrypted_message)
    date_formatter = ddmmyy(encryptor_class.offset.current_date)
    puts "Created #{ARGV[1]} with the key #{encryptor_class.offset.current_key} and date #{date_formatter}"  
  end
end

Encrypt.new
