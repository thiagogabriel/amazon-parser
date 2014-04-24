require_relative 'category/book'
require_relative 'category/movie'
require_relative 'category/unknown'
require 'nokogiri'
require 'open-uri'

class Product
  extend Forwardable
  attr_reader :uri
  def_delegators :product_object, :formatted_output

  def initialize(uri)
    @uri = uri
    @product_object = current_product.new(page_doc)
  end

  private
    attr_reader :page_doc, :product_object

    def page_doc
      @page_doc ||= Nokogiri::HTML(open(uri))
    end

    def current_product
      [Category::Book, Category::Movie, Category::Unknown].detect do |klass|
        klass.matches?(page_doc)
      end
    end
end
