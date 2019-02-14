require 'optparse'
require_relative 'lib/server_log_files/parser'
require_relative 'lib/server_log_files/analyzer'

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


parser = ServerLogFiles::Parser.new(path: options[:file])
analyzer = ServerLogFiles::Analyzer.new(parser: parser).analyze

puts analyzer.page_views
puts analyzer.unique_views
