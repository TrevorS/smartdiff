require 'spec_helper'

describe Smartdiff::Document do
  before(:each) do
    @document = Smartdiff::Document.new('Test')
  end

  it 'responds to name' do
    expect(@document).to respond_to(:name)
  end

  it 'responds to lines' do
    expect(@document).to respond_to(:lines)
  end

  it 'responds to add' do
    expect(@document).to respond_to(:add)
  end

  it 'responds to delete' do
    expect(@document).to respond_to(:delete)
  end

  it 'has the correct name' do
    expect(@document.name).to eq 'Test'
  end

  it 'starts with zero lines' do
    expect(@document.lines.size).to eq 0
  end

  context 'accepts new lines' do
    it 'has a larger count' do
      @document.add('abcd', 1)
      expect(@document.lines.size).to eq 1
    end

    it 'has the new line' do
      @document.add('abcd', 1)
      expect(@document.lines.key?('abcd')).to be true
    end

    it 'correctly adds new locations to existing lines' do
      @document.add('abcd', 1)
      @document.add('abcd', 2)
      expect(@document.lines['abcd'].locations).to eq [1, 2]
    end
  end

  it 'deletes existing lines' do
    @document.add('abcd', 1)
    @document.delete('abcd')
    expect(@document.lines.size).to eq 0
  end
end
