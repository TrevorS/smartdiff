require 'spec_helper'

describe Smartdiff do
  before(:each) do
    src     = %w(abcd 1234 wxyz 1234).join("\n")
    @source = Smartdiff.load('source', src)

    tgt     = %w(abcd 1234 ffff).join("\n")
    @target = Smartdiff.load('target', tgt)
  end

  context 'source' do
    it 'loads data' do
      expect(@source.lines.size).to eq 3
    end

    it 'has correct lines' do
      expect(@source.lines.keys).to eq %w(abcd 1234 wxyz)
    end

    it 'has correct locations' do
      expect(@source.lines['1234'].locations).to eq [2, 4]
    end
  end

  context 'target' do
    it 'loads target data' do
      expect(@target.lines.size).to eq 3
    end

    it 'has correct lines' do
      expect(@target.lines.keys).to eq %w(abcd 1234 ffff)
    end

    it 'has correct locations' do
      expect(@target.lines['1234'].locations).to eq [2]
    end
  end
end
