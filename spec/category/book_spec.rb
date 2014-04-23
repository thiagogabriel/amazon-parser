require_relative '../spec_helper'
require_relative '../../lib/category/book'
require 'nokogiri'
require 'open-uri'

describe Category::Book do

  describe 'Book', :vcr do
    let!(:page_doc) { Nokogiri::HTML(open('http://www.amazon.com/gp/product/0465050654')) }
    subject { Category::Book.new(page_doc) }

    it 'receives a url' do
      expect(subject).to_not be_nil
    end

    it 'has name' do
      expect(subject.name).to eq 'The Design of Everyday Things: Revised and Expanded Edition'
    end

    it 'has price' do
      expect(subject.price).to eq '$11.37'
    end

    it 'has price for all formats' do
      expect(subject.price_for_all_formats).to eq "Kindle: $9.17\nPaperback: $11.37"
    end

    it 'has category' do
      expect(subject.category).to eq 'Books'
    end
  end
end
