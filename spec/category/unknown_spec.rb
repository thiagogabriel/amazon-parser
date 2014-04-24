require_relative '../spec_helper'
require_relative '../../lib/category/unknown'
require 'nokogiri'
require 'open-uri'

describe Category::Unknown do

  describe 'Unknown' do
    let(:unknown) { Category::Unknown.new('') }

    it 'is an instance' do
      expect(unknown).to_not be_nil
    end

    it 'has formatted_output' do
      expect(unknown.formatted_output).to eq 'Sorry! This product is not supported by this crawler'
    end

    describe '.matches?' do
      it 'always match' do
        expect(Category::Unknown.matches?('')).to be_true
      end
    end
  end
end
