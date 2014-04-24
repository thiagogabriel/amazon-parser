module Category
  class Movie

    def initialize(page_doc)
      @page_doc = page_doc
    end

    def formatted_output
      <<-OUTPUT.gsub(/^ {8}/, '')
        Title: #{title}
        Price: #{price}
        Category: #{category}
        Directors: #{directors}
        ASIN: #{asin}
        Language: #{language}
      OUTPUT
    end

    def title
      page_doc.css('#btAsinTitle').text
    end

    def price
      page_doc.css('#actualPriceValue').text
    end

    def category
      page_doc.css('ul#nav-subnav > li > a').first.text
    end

    def directors
      page_doc.css('#detail-bullets div.content li').each do |node|
        return detail_content(node) if has_directors?(node)
      end
    end

    def asin
      page_doc.css('#detail-bullets div.content li').each do |node|
        return detail_content(node) if has_asin?(node)
      end
    end

    def language
      page_doc.css('#detail-bullets div.content li').each do |node|
        return detail_content(node) if has_language?(node)
      end
    end

    def self.matches?(page_doc)
      page_doc.css("title").text.downcase.include?('movies & tv')
    end

    private
      attr_reader :page_doc

      def has_directors?(node)
        node.text.downcase.include?('director')
      end

      def has_asin?(node)
        node.text.downcase.include?('asin:')
      end

      def has_language?(node)
        node.text.downcase.include?('language:')
      end

      def detail_content(node)
        node.text.split(':')[1..-1].join.strip
      end
  end
end
