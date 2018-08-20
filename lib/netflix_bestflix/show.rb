class NetflixBestflix::Show
  attr_accessor :title, :position, :url, :starring, :genre, :rt_score, :viewer_score, :cast,  :tv_network, :description, :created_by, :seasons
  @@all = []

  def initialize(title = nil, starring = nil, position = nil, url = nil)
    @title = title
    @starring = starring
    @position = position
    @url = url
    @@all << self
  end

  def self.new_from_scrape(s)
    self.new(
      s.css("h2 a").text,
      s.css(".cast").css("a").text, # need to make sure cast names are separated
      s.css(".countdown-index").text.gsub('#',''),
      s.css("div a").attr("href").value.gsub('//', 'https://')
      # "https://www.rottentomatoes.com/tv/#{s.css("h2 a").text.gsub(' ', '_')}/"
    )
  end

  def self.find_by_position(position)
      self.all.find {|show| show.position == position}
  end

  def genre
    @genre ||= doc.css(".panel-body tr:nth-child(3) td:nth-child(2)").text
  end

  def rt_score
    @rt_score ||= doc.css(".critic-score .meter-value").text
  end

  def viewer_score
    @viewer_score ||= doc.css(".audience-score .meter-value span").text
  end

  def cast
    @cast ||= doc.css(".cast-item .media-body a span").text
  end

  def tv_network
    @tv_network ||= doc.css(".panel-body tr:nth-child(1) td:nth-child(2)").text
  end

  def description
    @description ||= doc.css("#movieSynopsis").text.strip
  end

  def created_by
    @created_by ||= doc.css(".movie_info a").text #need commas to separate names 
  end

  def seasons
    @seasons ||= doc.css("#seasonList .seasonItem").count
  end

  def self.all
    @@all
  end

  def doc
    page ||= Nokogiri::HTML(open(self.url))
    # puts "#{self.url}"
    @doc = page.css(".tv-container")
  end

end
