class NetflixBestflix::Show
  attr_accessor :title, :position, :url, :rt_score, :viewer_score, :cast, :description, :created_by, :seasons
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
      s.css("div a").attr("href").value.gsub('//', 'https://')
    )
  end

  def self.find_by_position(position)
      self.all.find {|show| show.position == position}
  end

  def rt_score
    @rt_score ||= doc.css(".critic-score .meter-value").text.gsub(/%(.*)/, "%")
  end

  def viewer_score
    @viewer_score ||= doc.css(".audience-score .meter-value span").text
  end

  def cast
    @cast ||= doc.css(".cast-item .media-body a span").text
  end

  def description
    @description ||= doc.css("#movieSynopsis").text.strip
  end

  def created_by
    @created_by ||= doc.css(".movie_info a").text.split(/(?=[A-Z])/).each_with_index.collect do |c, i|
      ("#{c}," if i.odd? && i != -1)  || "#{c}"
    end.join.gsub(' ,', ' ').gsub(',', ', ') #need commas to separate names
  end

  def seasons
    @seasons ||= doc.css("#seasonList .seasonItem").count
  end

  def self.all
    @@all
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url)).css(".tv-container")
  end

end
