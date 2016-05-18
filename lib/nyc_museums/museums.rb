class NycMuseums::Museums
  attr_accessor :name, :url
  @@all = []

  def initialize(name = nil, url = nil)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.list_all
    self.all.each_with_index(1) do |museum, i|
      puts "#{i}. museum.name"
    end
  end

end