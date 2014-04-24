module Category
  class Unknown

    def initialize(page_doc)
    end

    def formatted_output
      'Sorry! This product is not supported by this crawler'
    end

    def self.matches?(page_doc)
      true
    end
  end
end
