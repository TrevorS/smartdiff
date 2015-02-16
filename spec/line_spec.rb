require 'spec_helper'

describe Smartdiff::Line do
  before(:each) do
    @line = Smartdiff::Line.new('abcd')
    @line << 1
  end

  it 'responds to data' do
    expect(@line).to respond_to(:data)
  end

  it 'responds to locations' do
    expect(@line).to respond_to(:locations)
  end

  it 'responds to <<' do
    expect(@line).to respond_to(:<<)
  end

  it 'has one location' do
    expect(@line.locations.size).to eq 1
  end

  it 'has the correct location' do
    expect(@line.locations).to eq [1]
  end

  context 'accepts new locations' do
    it 'has a larger count' do
      @line << 2
      expect(@line.locations.size).to eq 2
    end

    it 'has the new location' do
      @line << 2
      expect(@line.locations).to eq [1, 2]
    end
  end
end
