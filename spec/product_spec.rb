require 'spec_helper'
require_relative '../lib/product'

describe Product do
  describe 'Book', vcr: { cassette_name: 'book/the_design_of_everyday_things' } do
    let(:product) { Product.new('http://www.amazon.com/gp/product/0465050654') }

    it 'has uri' do
      expect(product.uri).to eq 'http://www.amazon.com/gp/product/0465050654'
    end
  end
end
