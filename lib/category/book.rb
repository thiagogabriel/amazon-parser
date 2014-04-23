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

    def price_for_all_formats
      page_doc.css("#MediaMatrix .swatchElement").inject('') do |memo, node|
        memo + formatted_box(node)
      end.strip
    end

    def category
      page_doc.css('ul#nav-subnav > li > a').first.text
    end

    private
      attr_reader :page_doc

      def formatted_box(box)
        kind, price = box.text.split
        "#{kind}: #{price}\n"
      end
  end
end
