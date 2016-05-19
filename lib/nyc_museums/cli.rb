class NycMuseums::CLI

  def call
    create_and_list_museums
    menu_2
    goodbye
  end

  def create_and_list_museums
    puts "NYC's Museums:"
    NycMuseums::Museums.create_by_scraping
    NycMuseums::Museums.list_all
  end

  def list_museums
    NycMuseums::Museums.list_all
  end

  def menu
    puts 
    puts "Please do one of the following:"
    puts "1) list the number of the museum you are interested in visiting"
    puts "2) type 'list' to see the list again"
    puts "3) type exit"
    puts 

    input = nil
    while input != "exit"
      input = gets.strip
      case input
      when  "1"
        puts "more info on Alice Austen"
        puts "- - - - - "
        puts 
        puts "List the number of the museum you are interested in visiting, or type 'list' to see the list again or type exit:"
        puts
      when "2"
        puts "more info on American Folk"
        puts "- - - - - "
        puts
        puts "List the number of the museum you are interested in visiting, or type 'list' to see the list again or type exit:"
        puts
      when "list"
        self.
      else
        puts "Not sure what you want. Please enter a different number:"
      end
    end
  end

  def menu_2
    puts 
    puts "Please do one of the following:"
    puts "1) list the number of the museum you are interested in visiting"
    #puts "2) type 'list' to see the list again"
    puts "3) type exit"
    puts 

    input = nil
    while input != "exit"
      input = gets.strip
      if input.to_i.to_s == input
        NycMuseums::Museums.add_these_details(input.to_i - 1)
        puts NycMuseums::Museums.all[input.to_i - 1].name
        puts 
        puts NycMuseums::Museums.all[input.to_i - 1].info
        puts "Description:"
        puts NycMuseums::Museums.all[input.to_i - 1].description  
        puts "- - - - - "
        puts 
        puts "List the number of another museum you are interested in visiting, or type 'list' to see the list again or type exit:"
        puts
      elsif input == "list"
        list_museums
      end
    end
  end

  def goodbye
    puts "Enjoy your visit!"
  end

  def self.try_3
    NycMuseums::Museums.create_by_scraping
    NycMuseums::Museums.add_details_from_individual_page
    puts NycMuseums::Museums.all[1].name
    puts 
    puts NycMuseums::Museums.all[1].info
    puts "Description:"
    puts NycMuseums::Museums.all[1].description
  end

end