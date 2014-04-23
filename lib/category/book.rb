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
      page_doc.css('#MediaMatrix .swatchElement').inject('') do |memo, node|
        memo + formatted_box(node)
      end.strip
    end

    def category
      page_doc.css('ul#nav-subnav > li > a').first.text
    end

    def author
      page_doc.css('.author > a').text
    end

    def all_isbn
      page_doc.css('table#productDetailsTable div.content li').inject('') do |memo, node|
        if contains_isbn?(node)
          memo + formatted_isbn(node)
        else
          memo
        end
      end.strip
    end

    def language
      page_doc.css('table#productDetailsTable div.content li').inject('') do |memo, node|
        return node.text.split.last if contains_language?(node)
      end
    end

    private
      attr_reader :page_doc

      def formatted_box(box)
        kind, price = box.text.split
        "#{kind}: #{price}\n"
      end

      def contains_isbn?(node)
        node.text.downcase.include?('isbn')
      end

      def contains_language?(node)
        node.text.downcase.include?('language:')
      end

      def formatted_isbn(node)
        "#{node.text}\n"
      end
  end
end
