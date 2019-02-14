require 'spec_helper'

describe ServerLogFiles::Analyzer do
  before :all do
    @parser = ServerLogFiles::Parser.new(path: @log_file_path)
    @analyzer = ServerLogFiles::Analyzer.new(parser: @parser).analyze

    @valid_response_page_views = { '/about' => 1, '/about/2' => 1, '/contact' => 1, '/help_page/1' => 4, '/home' => 2, '/index' => 1 }
    @valid_response_uniq_views = { '/about' => 1, '/about/2' => 1, '/contact' => 1, '/help_page/1' => 2, '/home' => 2, '/index' => 1 }
  end

  it 'returns valid page_views array' do
    expect(@analyzer.page_views(format: :hash)).to eq(@valid_response_page_views)
  end

  it 'returns valid unique_views array' do
    expect(@analyzer.unique_views(format: :hash)).to eq(@valid_response_uniq_views)
  end
end
