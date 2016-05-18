class NycMuseums::Museums
  attr_accessor :name, :url, :info, :description
  @@all = []

  def initialize(name = nil, url)
    @name = name
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def self.list_all
    self.all.each.with_index(1) do |museum, i|
      puts "#{i}. #{museum.name}"
    end
  end

  def self.create_by_scraping
    array_of_museum_properties = Scraper.scrape_museum_page
    array_of_museum_properties.each do |x|
      self.new(x[:name], "https://ny.com/museums/#{x[:url]}")
    end
  end

  def self.add_details
  end

end