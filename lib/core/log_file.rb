module Core
class LogFile
  @@logs_folder =  Rails.root.join("public/files/logs/")

  def initialize(file)
    @file = file
  end

  def get_items
    File.open("#{@@logs_folder}#{@file}", 'r') do |file|

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

  def self.get_logs_count
    Dir.glob("#{@@logs_folder}*").count
  end

  def self.get_last_log
    filename = Dir.glob("#{@@logs_folder}*").max_by {|file| File.mtime(file)}

    File.basename(filename)
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