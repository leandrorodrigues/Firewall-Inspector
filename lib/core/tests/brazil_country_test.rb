module Core
module Tests
class BrazilCountryTest < OriginTest
  @@brazil_ranges = []

  def self.test(item)
    ip = IPAddr.new item['origin_ip']

    @@brazil_ranges = Core::LacnicDelegatedFile::get_brazil_ranges if @@brazil_ranges.empty?

    @@brazil_ranges.each do |range|
      if ip > range[0] && ip < range[1]
        return true
      end
    end

    return false
  end
end
end
end