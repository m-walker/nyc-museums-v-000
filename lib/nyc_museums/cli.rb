class NycMuseums::CLI

  def call
    list_museums
    menu
    goodbye
  end

  def list_museums
    puts <<-DOC.gsub /^\s*/, ''
      NYC's Museums:
      1. Alice Austen House Museum
      2. American Folk Art Museum
      3. American Museum of Natural History
      4. American Museum of the Moving Image
      5. American Numismatic Society
      6. Americas Society
      7. Anne Frank
      8. Artists Space
      9. Asia Society and Museum
      etc
    DOC
  end

  def menu
    puts ""
    puts "List the number of the museum you are interested in visiting, or type 'list' to see the list again or type exit:"
    puts ""
    input = nil
    while input != "exit"
      input = gets.strip
      case input
      when  "1"
        puts "more info on Alice Austen"
        puts "List the number of the museum you are interested in visiting, or type 'list' to see the list again or type exit:"
      when "2"
        puts "more info on American Folk"
        puts "List the number of the museum you are interested in visiting, or type 'list' to see the list again or type exit:"
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