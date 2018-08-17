class Netflix_bestflix::Show
  attr_accessor :title, :genre, :rt_score, :viewer_score, :cast, :starring, :tv_network, :description, :created_by, :seasons, :rating
  @@all = []

  def initialize(:title = nil, :genre = nil, :rt_score = nil, :viewer_score = nil, :cast = nil, :starring = nil, :tv_network = nil, :description = nil, :created_by = nil, :seasons = nil, :rating = nil)
    @title = title
    @genre = genre
    @rt_score = rt_score
    @viewer_score = viewer_score
    @cast = cast
    @starring = starring
    @tv_network = tv_network
    @description = description
    @created_by = created_by
    @seasons = seasons
    @rating = rating
  end

  def self.new_from_scrape(r)
    self.new(
      r.

    )
  end

  def self.all
    @@all
  end

end
