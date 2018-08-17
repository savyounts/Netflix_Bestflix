class Netflix_Bestflix::CLI

  def call
    Netflix_bestflix::Scraper.new.make_show_from_index
    puts "Welcome to Netflix Bestflix, a great way to show you Rotten Tomatoe's top rated shows and movies on Netflix!"
    start
  end

  def start
    puts ""
    puts "Would you like to look at movies or shows?"
    input = gets.strip.downcase
    if input == "movies"
      movies
    if input == "shows"
      shows
    else
      put "I'm sorry, I didn't understand your answer. Please type 'movies' or 'shows'."
    end
  end

  def movies
    puts "What number movies would you like to see? 1-10, 11-20, 21-30, 31-40, 41+? Enter the first number of the group you'd like to see:"
    movie_numbers = gets.strip.to_i

    print_movies(movie_numbers)

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
      print_movies(movie_numbers) #needs to be able to ask for movie # again
    if input == "new"
      movies
    if input == "shows"
      shows
    if input == "exit"
      puts "Goodbye for now, happy viewing!"
    else
      puts "Sorry, I didn't understand your answer. Please type 'back', 'new', 'shows' or 'exit'."
      input = gets.strip.downcase
    end
  end

  def shows
    puts "What number shows would you like to see? 1-10, 11-20, 21-30, 31-40, 41-50, 51-60, 61-70, 71-80, 81-9 0or 91+? Type the first number of the group you'd like to see:"
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
      print_movies(movie_numbers) #needs to be able to ask for movie # again
    if input == "new"
      shows
    if input == "movies"
      movies
    if input == "exit"
      puts "Goodbye for now, happy viewing!"
    else
      puts "Sorry, I didn't understand your answer. Please type 'back', 'new', 'shows' or 'exit'."
      input = gets.strip.downcase
    end
  end





end
