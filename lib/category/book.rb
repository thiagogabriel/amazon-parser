module Category
  class Book
    def initialize(page_doc)
      @page_doc = page_doc
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
  end
end
