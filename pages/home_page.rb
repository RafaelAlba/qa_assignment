module Wikipedia
  class HomePage
    SEARCH_FIELD_ID = 'searchInput'
    SEARCH_BUTTON_NAME = 'go'
    URL = 'http://www.wikipedia.org'

    def initialize(driver)
      @driver = driver
    end

    def visit
      @driver.navigate.to URL
      self
    end

    def search_for(term)
      search_field.send_keys term
      search_button.click
      SearchResultsPage.new(@driver)
    end

    private
    def search_field
      @driver.find_element(:id, SEARCH_FIELD_ID)
    end

    def search_button
      @driver.find_element(:name, SEARCH_BUTTON_NAME)
    end
  end
end
