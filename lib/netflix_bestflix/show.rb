class Netflix_bestflix::Show
  attr_accessor :title, :genre, :rt_score, :viewer_score, :cast, :starring, :tv_network, :description, :created_by, :seasons, :rating
  @@all = []

  def initialize(attributes)
    attributes.each {|k, v| self.send(("#{k}=", v))}
    @@all << self
  end

  def self.create_show_from_hash(shows_hash)
    show.hash.each {|s| new_show = Show.new(s)}
  end

  def self.all
    @@all
  end 

end
