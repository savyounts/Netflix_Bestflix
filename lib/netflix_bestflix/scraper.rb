
class Scraper

  def get_page
    Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/best-netflix-shows-and-movies-to-binge-watch-now"))
  end

  def scrape_show_index
    self.get_page.css("div .articleContentBody div")
  end

  def make_show
    scrape_show_index.each {|s| Netflix_bestflix::Show.new(r)}
  end
end
