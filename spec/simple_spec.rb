require "selenium-webdriver"

describe "Test" do
  it "should search Wikipedia for information about Pandas" do
    driver = Selenium::WebDriver.for :firefox
    driver.navigate.to "http://www.wikipedia.org"

    element = driver.find_element(:id, 'searchInput')
    element.send_keys "Panda"
    button = driver.find_element(:name, 'go')
    button.click
    heading_text = driver.find_element(:id, 'firstHeading').text
    heading_text.should == "Giant panda"
    driver.quit
  end
end