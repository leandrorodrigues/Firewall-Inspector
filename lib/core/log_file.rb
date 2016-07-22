module Core
class LogFile


  def initialize(file)
    @file = file
  end

  def get_items
    File.open(Rails.root.join("public/files/logs/#{@file}"), 'r') do |file|

      @items = []
      while line = file.gets do
        item = readline(line)
        if !item.nil?
          @items << Hash[item.names.zip(item.captures)]
        end
      end
    end

    @items
  end

  private
    def readline(line)
      line_regex.match(line)
    end

    def line_regex
      %r{
        (?<protocol>TCP|UDP)\s
        (?<origin_interface>.*)\s
        (?<origin_ip>\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}):
        (?<origin_port>\d*)\s
        (?<host>.*)\s
        (?<dest_ip>\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}):
        (?<dest_port>\d*),\s
        idle\s
        (?<idle>\d*:\d*:\d*),\s
        bytes\s
        (?<bytes>\d*),\s
        flags\s
        (?<flags>.*)\r
      }x
    end

end
end