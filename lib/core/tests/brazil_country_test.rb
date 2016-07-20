module Core
module Tests
class BrazilCountryTest < OriginTest
  @@brazil_ranges = []

  def self.test(item)
    ip = IPAddr.new item['origin_ip']

    read_delegated_file if @@brazil_ranges.empty?

    @@brazil_ranges.each do |range|
      if ip > range[0] && ip < range[1]
        return true
      end
    end

    return false
  end

  def self.read_delegated_file
    puts 'Notice: Delegated file reading...'

    File.open(Rails.root.join("public/files/lacnic/delegated.txt"), 'r') do |file|
      while line = file.gets do
        columns = line.split('|')

        next if columns[0] != 'lacnic' || columns[1] != 'BR' || columns[2] != 'ipv4' || columns[6] != "allocated\n"

        start = IPAddr.new columns[3]
        finish = IPAddr.new(start.to_i + Integer(columns[4]), Socket::AF_INET)

        @@brazil_ranges << [start, finish]
      end
    end

    puts 'Notice: Delegated file read finish.'
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
end