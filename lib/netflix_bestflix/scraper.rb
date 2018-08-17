
class NetflixBestflix::Scraper


  def self.scrape_show_index
    doc = Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/best-netflix-shows-and-movies-to-binge-watch-now/"))
    doc.css("div .articleContentBody div").pry
  end

  def make_shows
    self.class.scrape_show_index.each do |show|
      NetflixBestflix::Show.new_from_scrape(show)
    end
  end
end
