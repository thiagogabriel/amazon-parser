require 'spec_helper'
require_relative '../lib/product'

describe Product do
  describe 'Book', vcr: { cassette_name: 'book/the_design_of_everyday_things' } do
    let(:product) { Product.new('http://www.amazon.com/gp/product/0465050654') }

    it 'has uri' do
      expect(product.uri).to eq 'http://www.amazon.com/gp/product/0465050654'
    end

    it 'has formatted_output' do
      expect(product.formatted_output).to_not be_nil
    end
  end

  describe 'Movie', vcr: { cassette_name: 'blu-ray/frozen' } do
    let(:product) { Product.new('http://www.amazon.com/Frozen-Two-Disc-Blu-ray-Digital-Copy/dp/B00G5G7K7O') }

    it 'has uri' do
      expect(product.uri).to eq 'http://www.amazon.com/Frozen-Two-Disc-Blu-ray-Digital-Copy/dp/B00G5G7K7O'
    end

    it 'has formatted_output' do
      expect(product.formatted_output).to_not be_nil
    end
  end

  describe 'Unknown', vcr: { cassette_name: 'sports/soccer-ball' } do
    let(:product) { Product.new('http://www.amazon.com/Vizari-Astro-Soccer-Ball-Green/dp/B0083YM3EQ/') }

    it 'has uri' do
      expect(product.uri).to eq 'http://www.amazon.com/Vizari-Astro-Soccer-Ball-Green/dp/B0083YM3EQ/'
    end

    it 'has formatted_output' do
      expect(product.formatted_output).to eq 'Sorry! This product is not supported by this crawler'
    end
  end
end
