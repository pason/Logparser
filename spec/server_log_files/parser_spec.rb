require 'spec_helper'

describe ServerLogFiles::Parser do
  before :all do
    @valid_response = [['/help_page/1', '126.318.035.038'],
                       ['/contact', '184.123.665.067'],
                       ['/home', '184.123.665.067'],
                       ['/about/2', '444.701.448.104'],
                       ['/help_page/1', '126.318.035.038'],
                       ['/index', '444.701.448.104'],
                       ['/help_page/1', '126.318.035.038'],
                       ['/about', '061.945.150.735'],
                       ['/help_page/1', '646.865.545.408'],
                       ['/home', '235.313.352.950']]
  end

  it 'raise ArgumentError if file not passed' do
    expect { ServerLogFiles::Parser.new(path: '') }.to raise_error(ArgumentError)
  end

  it 'parses log file' do
    parser = ServerLogFiles::Parser.new(path: @log_file_path)
    parsed_response = []
    parser.parse { |url, host| parsed_response << [url, host] }

    expect(parsed_response.size).to eq(10)
    expect(parsed_response).to eq(@valid_response)
  end
end
