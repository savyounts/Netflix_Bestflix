class NetflixBestflix::CLI

  def call
    NetflixBestflix::Scraper.new.make_shows
    puts "Welcome to Netflix Bestflix, a great way to show you Rotten Tomatoe's top rated shows and movies on Netflix!"
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
    puts "What number movies would you like to see? 1-10, 11-20, 21-30, 31-40, 41+? Enter the first number of the group you'd like to see:"
    start_number = gets.strip.to_i

    print_movies(start_number)

    puts "Type the number of the movie you would like more information about:"
    input = gets.strip.to_i

    print_movie(input)
    puts ''

    puts "Type 'back' if you'd like to go back to your list of movies."
    puts "Type 'new' if you'd like to choose a new list of movies."
    puts "Type 'shows' if you'd like to look at shows."
    puts "Type 'exit' if you are done."

    input = gets.strip.downcase
    if input == "back"
      print_movies(start_number) #needs to be able to ask for movie # again
    elsif input == "new"
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

    puts "Type the number of the show you would like more information about:"
    input = gets.strip.to_i

    print_show(input)
    puts ''

    puts "Type 'back' if you'd like to go back to your list of shows."
    puts "Type 'new' if you'd like to choose a new list of shows."
    puts "Type 'movies' if you'd like to look at movies."
    puts "Type 'exit' if you are done."

    input = gets.strip.downcase
    if input == "back"
      print_shows(start_number) #needs to be able to ask for shows again
    elsif input == "new"
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
      puts "#{show.position}. #{show.title} - Starring: #{show.starring.flatten}"
    end
  end

  def print_show(input)
    movies = ["movie", "movie2", "movie3", "movie4"]
    puts movies[input]
  end

end
