
class NetflixBestflix::Scraper


  def self.scrape_show_index
    doc = Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/best-netflix-shows-and-movies-to-binge-watch-now"))
    doc.css("div .articleContentBody div")
  end

  def make_show_from_index
    scrape_show_index.each do |show|
      Netflix_bestflix::Show.new_from_scrape(show)
    end
  end
end
