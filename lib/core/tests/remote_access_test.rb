module Core
module Tests
class RemoteAccessTest < OriginTest
  def self.test(item)
    Core::NetUtils::is_port_open? item['origin_ip'], 22
  end
end
end
end