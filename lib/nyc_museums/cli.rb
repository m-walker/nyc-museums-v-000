class NycMuseums::CLI

  def call
    list_museums
    menu
    goodbye
  end

  def list_museums
    ### Avi's code:
    #
    #
    #@deals = DailyDeal::Deal.today
    #@deals.each.with_index(1) do |deal, i|
    #puts "#{i}. #{deal.name} - #{deal.price} - #{deal.availability}"
    #
    ###

    ### my brainstorming
    #
    puts "NYC's Museums:"
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
        list_museums
      else
        puts "Not sure what you want. Please enter a different number:"
      end
    end
  end

  def goodbye
    puts "Enjoy your visit!"
  end

end