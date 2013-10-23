require 'selenium-webdriver'

describe 'Test' do
  it 'should search Wikipedia for information about Pandas' do
    driver = Selenium::WebDriver.for :firefox
    driver.navigate.to 'http://www.wikipedia.org'

    element = driver.find_element(:id, 'searchInput')
    element.send_keys 'Panda'
    button = driver.find_element(:name, 'go')
    button.click
    heading_text = driver.find_element(:id, 'firstHeading').text
    heading_text.should == 'Giant panda'
    driver.quit
  end

  it 'should see Wikipedia link when you search bing for information about Pandas' do
    driver = Selenium::WebDriver.for :firefox
    driver.navigate.to 'http://www.bing.com'

    search_box = driver.find_element(:id, 'sb_form_q')
    search_box.send_keys 'Panda'
    search_box.send_keys :enter

    search_results = driver.find_element(:id, 'b_results')
    wait = Selenium::WebDriver::Wait.new(:timeout => 5)
    begin
      wait.until { search_results.text.should include("Giant panda - Wikipedia, the free encyclopedia") }
    end
    driver.quit
  end
end