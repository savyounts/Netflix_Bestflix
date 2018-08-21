class NetflixBestflix::CLI

  def call
    NetflixBestflix::Scraper.new.make_shows
    NetflixBestflix::Scraper.new.make_movies
    puts "Welcome to Netflix Bestflix, a great way to show you Rotten Tomatoes' top rated shows and movies on Netflix!"
    puts "Would you like to look at movies or shows?"
    start
  end

  def start
    puts ""
    input = gets.strip.downcase
    if input == "movies"
      movies
    elsif input == "shows"
      shows
    elsif input == "exit"
      puts "Goodbye for now, happy viewing!"
    else
      puts "I'm sorry, I didn't understand your answer. Please type 'movies' or 'shows'."
      start
    end
  end

  def movies
    start_number = nil
    while start_number.to_i == 0 || start_number.to_i > NetflixBestflix::Movie.all.size
      puts ""
      puts "Which movies would you like to see? 1-10, 11-20, 21-30, 31-40, 41+?"
      puts "Enter the first number of the group you'd like to see:"
      start_number = gets.strip.to_i
    end

    print_movies(start_number)

    input = nil
    while input.to_i == 0 || input.to_i > NetflixBestflix::Movie.all.size
    puts ""
    puts "Type the number of the movie you would like more information about:"
    input = gets.strip.to_i
    end 
    print_movie(input)
    puts ""

    puts "Type 'new' if you'd like to choose a new list of movies."
    puts "Type 'shows' if you'd like to look at shows."
    puts "Type 'exit' if you are done."
    puts ""

    input = gets.strip.downcase
    if input == "new"
      movies
    elsif input == "shows"
      shows
    elsif input == "exit"
      puts "Goodbye for now, happy viewing!"
    else
      puts "Sorry, I didn't understand your answer. Please type 'back', 'new', 'shows' or 'exit'."
      input = gets.strip.downcase
    end
  end

  def shows
    puts "What number shows would you like to see? 1-10, 11-20, 21-30, 31-40, 41-50, 51-60, 61-70, 71-80, 81-90 or 91+?"
    puts "Type the first number of the group you'd like to see:"
    show_numbers = gets.strip.to_i

    print_shows(show_numbers)

    puts ""
    puts "Type the number of the show you would like more information about:"
    show_num = gets.strip.to_i

    print_show(show_num)
    puts ""

    puts "Type 'new' if you'd like to choose a new list of shows."
    puts "Type 'movies' if you'd like to look at movies."
    puts "Type 'exit' if you are done."
    puts ""

    input = gets.strip.downcase
    if input == "new"
      shows
    elsif input == "movies"
      movies
    elsif input == "exit"
      puts "Goodbye for now, happy viewing!"
    else
      puts "Sorry, I didn't understand your answer. Please type 'back', 'new', 'shows' or 'exit'."
      input = gets.strip.downcase
    end
  end

  def print_shows(start_num)
    puts ""
    puts " ------- Shows No.#{start_num} - #{start_num+9} -------"
    puts ""
    NetflixBestflix::Show.all[start_num-1..start_num+8].each do |show|
      puts "#{show.position}. #{show.title} - Starring: #{show.starring}"
    end
  end

  def print_movies(start_num)
    puts ""
    puts " ------- Movies No.#{start_num} - #{start_num+9} -------"
    puts ""
    NetflixBestflix::Movie.all[start_num-1..start_num+8].each do |movie|
      puts "#{movie.position}. #{movie.title} - Rated: #{movie.rating}"
    end
  end

  def print_show(show_num)
    show = NetflixBestflix::Show.find_by_position(show_num.to_s)
    puts ""
    puts " ------- No.#{show.position} #{show.title} -------"
    puts ''
    puts "Genre: #{show.genre}"
    puts "Rotten Tomatoes Rating: #{show.rt_score}"
    puts "Audience Rating: #{show.viewer_score}"
    puts "Description: #{show.description}"
    puts ""
    puts "Cast: #{show.cast}"
    puts "Seasons: #{show.seasons}"
    puts "Creators: #{show.created_by}"
    puts "TV Network: #{show.tv_network}"
  end

  def print_movie(show_num)
    movie = NetflixBestflix::Movie.find_by_position(show_num.to_s)
    puts ""
    puts " ------- No.#{movie.position} #{movie.title} -------"
    puts ''
    puts "Rating: #{movie.rating}"
    puts "Genre: #{movie.genre}"
    puts "Rotten Tomatoes Rating: #{movie.rt_score}"
    puts "Audience Rating: #{movie.viewer_score}"
    puts ""
    puts "Description: #{movie.description}"
  end
end
