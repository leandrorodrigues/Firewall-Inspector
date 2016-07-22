module Core
class LacnicDelegatedFile

  @@file_name = Rails.root.join("public/files/lacnic/delegated.txt")
  @@file_url = "ftp://ftp.lacnic.net/pub/stats/lacnic/delegated-lacnic-latest"

  def self.get_brazil_ranges
    puts 'Notice: Delegated file reading...'
    @@brazil_ranges = []

    File.open(@@file_name, 'r') do |file|
      while line = file.gets do
        columns = line.split('|')

        next if columns[0] != 'lacnic' || columns[1] != 'BR' || columns[2] != 'ipv4'

        start = IPAddr.new columns[3]
        finish = IPAddr.new(start.to_i + Integer(columns[4]), Socket::AF_INET)

        @@brazil_ranges << [start, finish]
      end
    end

    puts 'Notice: Delegated file read finish.'
    @@brazil_ranges
  end

  def self.get_file_time
    File.mtime(@@file_name)
  end

  def self.get_file_size
    File.size(@@file_name)
  end

  def self.update_file
    require 'open-uri'

    uri = open(@@file_url)


    content = uri.read

    raise if content.empty?

    open(@@file_name, 'wb') do |file|
      file << content
    end
  end

  def self.generate_masks
    masks = Hash.new

    (14..24).each do |i|
      masks[2 ** (i - 6)] = 38 - i
    end
    masks
  end
end
end