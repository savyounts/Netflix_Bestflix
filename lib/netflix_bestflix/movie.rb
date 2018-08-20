class NetflixBestflix_Moive
  attr_accessor :title, :position, :url, :starring, :genre, :rt_score, :viewer_score, :description, :rating
  @@all = []

  def initialize(title = nil, position = nil, url = nil)
    @title = title
    @position = position
    @url = url
    @@all << self
  end

  def self.new_from_scrape(s)
    self.new(
      s.css("h2 a").text,
      s.css(".countdown-index").text.gsub('#',''),
      s.css("h2 a").attr("href").value.gsub('//', 'https://')
    )
  end

  def self.find_by_position(position)
      self.all.find {|show| show.position == position}
  end

  def genre
    @genre ||= doc.css("ul.content-meta li:nth-child(2) meta-value").text
  end

  def rating
    @rating ||= doc.css("ul.content-meta li:nth-child(1) meta-value").text
  end

  def rt_score
    @rt_score ||= doc.css(".critic-score .meter-value").text.gsub(/%(.*)/, "%")
  end

  def viewer_score
    @viewer_score ||= doc.css(".audience-score .meter-value span").text
  end

  def description
    @description ||= doc.css("#movieSynopsis").text.strip
  end

  def self.all
    @@all
  end

  def doc
    page ||= Nokogiri::HTML(open(self.url))
    @doc = page.css("#mainColumn")
  end

end
