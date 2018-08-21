
class NetflixBestflix::Scraper


  def scrape_show_index_1
    doc = Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/best-netflix-shows-and-movies-to-binge-watch-now/"))
    doc.css(".countdown-item")
  end

  def scrape_show_index_2
    doc = Nokogiri::HTML(open("http://editorial.rottentomatoes.com/guide/best-netflix-shows-and-movies-to-binge-watch-now/2/"))
    doc.css(".countdown-item")
  end

  def scrape_show_index_3
    doc = Nokogiri::HTML(open("http://editorial.rottentomatoes.com/guide/best-netflix-shows-and-movies-to-binge-watch-now/3/"))
    doc.css(".countdown-item")
  end

  def scrape_show_index_4
    doc = Nokogiri::HTML(open("http://editorial.rottentomatoes.com/guide/best-netflix-shows-and-movies-to-binge-watch-now/4/"))
    doc.css(".countdown-item")
  end

  def scrape_movie_index
    doc = Nokogiri::HTML(open("https://editorial.rottentomatoes.com/guide/best-netflix-shows-and-movies-to-binge-watch-now/5/"))
    doc.css(".countdown-item")
  end

  def make_shows
    scrape_show_index_1.each {|s| NetflixBestflix::Show.new_from_scrape(s)}
    scrape_show_index_2.each {|s| NetflixBestflix::Show.new_from_scrape(s)}
    scrape_show_index_3.each {|s| NetflixBestflix::Show.new_from_scrape(s)}
    scrape_show_index_4.each {|s| NetflixBestflix::Show.new_from_scrape(s)}
  end

  def make_movies
    scrape_movie_index.each do |s|
      NetflixBestflix::Movie.new_from_scrape(s)
    end
  end
end
