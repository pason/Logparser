require_relative '../lib/server_log_files/parser'
require_relative '../lib/server_log_files/analyzer'
require_relative '../lib/server_log_files/support/formater'


RSpec.configure do |config|
  config.before(:all) do
    @log_file_path = 'spec/samples/sample.log'
  end
end
