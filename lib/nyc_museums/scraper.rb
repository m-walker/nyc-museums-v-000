class Scraper

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

  def self.scrape_individual_page(museum_url)
    html = open(museum_url)
    doc = Nokogiri::HTML(html)
    museum_details_array = []

    info = doc.css(".col-md-3").text.gsub("\n      ", "").gsub("    ", "\n").gsub("   ", " ").gsub("Website", "Website:\n").gsub("Hours\nHours", "Hours:").gsub("Admission\nAdmission", "Admission:").gsub("Address & Phone", "\nAddress:").gsub("  P: ", "\nPhone:\n").gsub("Problems?\n", "")
    description = doc.css(".col-md-9 .lead").text.gsub("      ", "").gsub("\n", " ")
    museum_details_array << {info: info, description: description}

    museum_details_array
  end

end