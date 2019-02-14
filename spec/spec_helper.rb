require_relative '../lib/server_log_files/parser'


RSpec.configure do |config|
  config.before(:all) do
    @log_file_path = 'spec/samples/sample.log'
  end
end