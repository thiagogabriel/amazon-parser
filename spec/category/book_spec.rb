require_relative '../spec_helper'
require_relative '../../lib/category/book'
require 'nokogiri'
require 'open-uri'

describe Category::Book do

  describe 'Book', vcr: { cassette_name: 'book/the_design_of_everyday_things' } do
    let!(:page_doc) { Nokogiri::HTML(open('http://www.amazon.com/gp/product/0465050654')) }
    subject { Category::Book.new(page_doc) }

    it 'receives a url' do
      expect(subject).to_not be_nil
    end

    it 'has formatted_output' do
      expect(subject.formatted_output).to eq <<-OUTPUT.gsub(/^ {8}/, '')
        Title: The Design of Everyday Things: Revised and Expanded Edition
        Author: Don Norman
        Official Amazon Price:
        Kindle: $9.17
        Paperback: $11.37
        ISBN-10: 0465050654
        ISBN-13: 978-0465050659
        Language: English
      OUTPUT
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

    it 'has author' do
      expect(subject.author).to eq 'Don Norman'
    end

    it 'has isbn numbers' do
      expect(subject.all_isbn).to eq "ISBN-10: 0465050654\nISBN-13: 978-0465050659"
    end

    it 'has language' do
      expect(subject.language).to eq 'English'
    end
  end
end
