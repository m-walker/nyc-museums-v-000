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
    #array_of_museum_info_and_description = Scraper.scrape_individual_page(museum_url)

    #start with the array of all the museums I have
    #get their url, feed it to that Scraper method
    #save the details in the array
    #(new method) print out all the details for the user
    
    # Move to the cli method self.create_by_scraping
    self.all.each do |x|
      museum_info_and_descriptions = Scraper.scrape_individual_page(x.url)
        x.info = museum_info_and_descriptions[:info]
        binding.pry
        x.description = museum_info_and_descriptions[:description]
        binding.pry
      end

    #first testing
    puts self.all.first
        
  end

  def self.add_details_one(info_and_descriptions_hash)
    info_and_descriptions_hash[0][:info]
    info_and_descriptions_hash[0][:description]


    #info_and_descriptions_hash.each do |key, value|
    #  self.send("#{key}=", value)
  end

  def self.try
    self.create_by_scraping
    alice_austen_url = self.all.first.url
    hash = Scraper.scrape_individual_page(alice_austen_url)
    self.add_details_one(hash)
    #binding.pry
    self.all.first.info = hash[0][:info]
    self.all.first.description = hash[0][:description]

    puts self.all.first.name
    puts 
    puts self.all.first.info
    puts "Description:"
    puts self.all.first.description
    

    #self.add_details_one(Scraper.scrape_individual_page(alice_austen_url))
  end

end