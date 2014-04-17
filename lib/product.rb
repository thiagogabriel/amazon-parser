require 'nokogiri'
require 'open-uri'
require 'pry'

class Product
  attr_reader :uri

  def initialize(uri)
    @uri = uri
  end

  def name
    page_doc.css('#productTitle').text
  end

  def price
    page_doc.css('#buyNewSection .offer-price').text
  end

  def category
    page_doc.css('ul#nav-subnav > li > a').first.text
  end

  private
    attr_reader :page_doc

    def page_doc
      @page_doc ||= Nokogiri::HTML(open(uri))
    end
end
