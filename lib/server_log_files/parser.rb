# Parser
module ServerLogFiles
  class Parser

    LOG_FORMAT = /(.+)\s(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})/

    def initialize(path:)
      raise ArgumentError unless File.exists?(path)
      @log = File.open(path)
    end

    def parse
      @log.each_line do |line|
        url, host = line.scan(LOG_FORMAT).first
        yield url, host
      end
    end
  end
end
