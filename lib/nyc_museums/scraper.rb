class Scraper
  #  all_students = doc.css(".roster-cards-container")
  #  all_students_array = []

  #def self.scrape_profile_page(profile_url)
    #html = open(profile_url)
   # doc = Nokogiri::HTML(html)
 #   for_links = doc.css(".vitals-container")
   # profile_hash = {}
#
 ##   links_array = for_links.css(".social-icon-container a").map { |x| x.attribute('href').value}
   ##   links_array.each do |x|
  # #   if x.include?("linkedin")
#   #     profile_hash[:linkedin] = x
 #  #   elsif x.include?("github")
   #     profile_hash[:github] = x
#   #   elsif x.include?("twitter")
  # #     profile_hash[:twitter] = x
  # #   else
  # #     profile_hash[:blog] = x
  # #   end
  #  end
  #  profile_hash[:profile_quote] = doc.css(".vitals-container .vitals-text-container .profile-quote").first.children.text
  #  profile_hash[:bio] = doc.css(".details-container .bio-block.details-block .bio-content.content-holder .description-holder p").text
  #  
  #  profile_hash

  def self.scrape_museum_page
    html = open("https://ny.com/museums/all.museums.html")
    doc = Nokogiri::HTML(html)
    all_museums_array = []

    all_elements = doc.css(".col-md-6 .list-unstyled a")
    all_elements.each do |element|
      name = element.text
      url = element.attr("href")
      all_museums_array << {name: name, url: url}
    end

    all_museums_array
  end

  def self.scrape_individual_page
    html = open("https://ny.com/museums/alice.austen.house.museum.and.garden.html")
    doc = Nokogiri::HTML(html)
    museum_details_array = []

    info = doc.css(".col-md-3").text.gsub("\n      ", "\n")
    description = doc.css(".col-md-9 .lead").text
    museum_details_array << {info: info, description: description}

    puts museum_details_array.first[:info]


    #puts "museum info: #{museum_details_array[:info]}"
    #puts "museum description: #{museum_details_array[:description]}"
  end

end