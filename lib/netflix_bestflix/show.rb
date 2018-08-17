class NetflixBestflix::Show
  attr_accessor :title, :position, :url, :starring, :genre, :rt_score, :viewer_score, :cast,  :tv_network, :description, :created_by, :seasons
  @@all = []

  def initialize(title = nil, starring = nil, rating = nil, url = nil)
    @title = title
    @starring = starring
    @position = postion
    @url = url
    @@all << self
  end

  def self.new_from_scrape(s)
    self.new(
      s.css("h2 a").text,
      s.css(".cast a").collect {|c| c.css.text},
      s.css(".countdown-index").text,
      s.css(".article-movie-poster").attr("href").value
    )
  end

  def genre
    @genre || doc.css(".panel-body tr:nth-child(3) td:nth-child(2)").text
  end

  def rt_score
    @rt_score || doc.css(".critic-score .meter-value span").text
  end

  def viewer_score
    @viewer_score || doc.css(".audience-score .meter-value span").text
  end

  def cast
    @cast || doc.css(".cast-item").collect do |c|
      c.css(".cast-item .media-body a span").text
    end
  end

  def tv_network
    @tv_network || doc.css(".panel-body tr:nth-child(1) td:nth-child(2)").text
  end

  def description
    @description || doc.css("#movieSynopis").text.strip
  end

  def created_by
    @created_by || doc.css(".movie-info div:nth-child(2)").collect do |c|
      c.css("a").text
    end
  end

  def seasons
    seasons = 0
    @seasons|| doc.css(".panel-body tr:nth-child(1) td:nth-child(2)").text
  end

  def self.all
    @@all
  end

  def doc
    @doc = Nokogiri::HTML(open(self.url))
  end

end
