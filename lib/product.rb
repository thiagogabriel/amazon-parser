require 'category/book'
require 'nokogiri'
require 'open-uri'
require 'pry'

class Product
  extend Forwardable
  attr_reader :uri
  def_delegators :product_object, :name, :price, :category

  def initialize(uri)
    @uri = uri
    @product_object = Category::Book.new(page_doc)
  end

  private
    attr_reader :page_doc, :product_object

    def page_doc
      @page_doc ||= Nokogiri::HTML(open(uri))
    end
end
