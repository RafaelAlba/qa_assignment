module Wikipedia
  class SearchResultsPage
    FIRST_HEADING_ID = 'firstHeading'

    def initialize(driver)
      @driver = driver
    end

    def heading_text
      @driver.find_element(:id, FIRST_HEADING_ID).text
    end
  end
end
