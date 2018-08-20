
class NetflixBestflix::Scraper


  def scrape_show_index
    doc = Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/best-netflix-shows-and-movies-to-binge-watch-now/"))
    doc.css(".countdown-item")
  end

  def scrape_movie_index
    doc = Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/best-netflix-shows-and-movies-to-binge-watch-now/5/"))
    doc.css(".countdown-item")
  end

  def make_shows
    scrape_show_index.each do |s|
      NetflixBestflix::Show.new_from_scrape(s)
    end
  end

  def make_movies
    scrape_movie_index.each do |s|
      NetflixBestflix::Movie.new_from_scrape(s)
    end
  end
end
