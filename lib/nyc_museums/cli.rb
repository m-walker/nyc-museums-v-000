class NycMuseums::CLI

  def call
    create_and_list_museums
    menu
    goodbye
  end

  def create_and_list_museums
    puts "New York is an incredible city. It has so many museums they can't be loaded onto a single page."
    puts "In fact, some people are so intimidated by the complete list that they'd rather just see half."
    puts "So we have three options for you:"
    puts "  1. Type '1' to see a list of the first 45 museums"
    puts "  2. Type '2' to see a list of the final 45 museums"
    puts "  3. Type '3' to see the complete list"
    puts "When you've made your selection, press 'enter' and you should see the list of your choosing!"
    sleep(1)
    puts "Enter your selection below:"
    initial_selection = gets.strip.to_i


    puts "NYC's Museums:"
    NycMuseums::Museums.create_by_scraping
    if initial_selection == 1
      NycMuseums::Museums.list_first_half
    elsif initial_selection == 2
      NycMuseums::Museums.list_second_half
    elsif initial_selection == 3
      NycMuseums::Museums.list_all
    else
      puts "We didn't get that. Please enter the number 1, 2 or 3 and then press enter."
    end
  end

  def list_museums
    NycMuseums::Museums.list_all
  end

  def menu
    puts 
    puts "Please do one of the following:"
    puts "1) list the number of the museum you are interested in visiting"
    puts "2) type 'list' to see a exhaustive list of museums"
    puts "3) type exit if you want to leave the program"
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
      else
        puts "We're sorry. We didn't get that. Please type a number, 'list' or 'exit' and then press enter again."
      end
    end
  end

  def goodbye
    puts "Enjoy your visit!"
  end

end