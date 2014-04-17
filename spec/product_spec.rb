require 'spec_helper'
require_relative '../lib/product'

describe Product do
  describe 'Book', :vcr do
    subject { Product.new('http://www.amazon.com/gp/product/0465050654') }

    it 'receives a url' do
      expect(subject).to_not be_nil
    end

    it 'has name' do
      expect(subject.name).to eq 'The Design of Everyday Things: Revised and Expanded Edition'
    end

    it 'has price' do
      expect(subject.price).to eq '$11.37'
    end

    it 'has category' do
      expect(subject.category).to eq 'Books'
    end

    it 'has uri' do
      expect(subject.uri).to eq 'http://www.amazon.com/gp/product/0465050654'
    end
  end
end
