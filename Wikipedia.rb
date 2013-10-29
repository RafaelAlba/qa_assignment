Dir[File.dirname(__FILE__) + '/pages/**/*.rb'].each {|file| require file }

module Wikipedia
  def self.go_to_home_page driver
    wikipedia_page = HomePage.new driver
    wikipedia_page.visit
  end
end
