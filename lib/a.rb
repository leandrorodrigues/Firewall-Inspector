require 'socket'
require 'timeout'

class A
  def self.b
    puts is_port_open?('10.15.230.85', 22)
  end

  def self.is_port_open?(ip, port)
    begin
      Timeout::timeout(1) do
        begin
          s = TCPSocket.new(ip, port)
          s.close
          return true
        rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH
          return false
        end
      end
    rescue Timeout::Error
    end

    return false
  end
end