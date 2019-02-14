require 'spec_helper'

describe ServerLogFiles::Support::Formater do
  before :all do
    @dummy = Class.new { include ServerLogFiles::Support::Formater }.new
  end

  it 'responds to display_as' do
    expect(@dummy).to respond_to(:display_as)
  end

  it 'formates to text' do
    data = { 'bar' => 'foo' }
    expect(@dummy.display_as(data, :text)).to eq('bar foo')
  end
end
