require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: parse.rb [options]"

  opts.on("-f", "--file {file}","Path to log file", String) do |path|
    options[:file] = path
  end     

  opts.on( '-h', '--help', 'Display this screen' ) do
    puts opts
    exit
  end
end.parse!(ARGV)