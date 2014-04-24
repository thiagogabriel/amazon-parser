require_relative '../spec_helper'
require_relative '../../lib/category/movie'
require 'nokogiri'
require 'open-uri'

describe Category::Movie do

  describe 'Movie', vcr: { cassette_name: 'blu-ray/frozen' } do
    let!(:page_doc) { Nokogiri::HTML(open('http://www.amazon.com/Frozen-Two-Disc-Blu-ray-Digital-Copy/dp/B00G5G7K7O')) }
    let(:movie) { Category::Movie.new(page_doc) }

    it 'has formatted_output' do
      expect(movie.formatted_output).to eq <<-OUTPUT.gsub(/^ {8}/, '')
        Title: Frozen (Two-Disc Blu-ray / DVD + Digital Copy) (2013)
        Price: $26.92
        Category: Movies & TV
        Directors: Chris Buck, Jennifer Lee
        ASIN: B00G5G7K7O
        Language: English (DTS-HD High Res Audio), French (Dolby Digital 5.1), Spanish (Dolby Digital 5.1)
      OUTPUT
    end

    it 'has title' do
      expect(movie.title).to eq 'Frozen (Two-Disc Blu-ray / DVD + Digital Copy) (2013)'
    end

    it 'has price' do
      expect(movie.price).to eq '$26.92'
    end

    it 'has category' do
      expect(movie.category).to eq 'Movies & TV'
    end

    it 'has directors' do
      expect(movie.directors).to eq 'Chris Buck, Jennifer Lee'
    end

    it 'has asin' do
      expect(movie.asin).to eq 'B00G5G7K7O'
    end

    it 'has language' do
      expect(movie.language).to eq 'English (DTS-HD High Res Audio), French (Dolby Digital 5.1), Spanish (Dolby Digital 5.1)'
    end

    describe '.matches?' do
      context 'movie category' do
        it 'matches' do
          expect(Category::Movie.matches?(page_doc)).to be_true
        end
      end

      context 'book category', vcr: { cassette_name: 'book/the_design_of_everyday_things' } do
        let!(:page_doc) { Nokogiri::HTML(open('http://www.amazon.com/gp/product/0465050654')) }

        it 'does not match' do
          expect(Category::Movie.matches?(page_doc)).to be_false
        end
      end
    end
  end
end
