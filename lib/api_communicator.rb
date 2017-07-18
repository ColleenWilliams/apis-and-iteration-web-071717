require 'rest-client'
require 'json'
require 'pry'


def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)

  character_movies = []
  character_hash["results"].select do |attribute|
         attribute.select do |stat_name, stat_value|
         if stat_value == character
           character_movies.push(attribute["films"]).flatten!
         end
       end
     end
    #  character_movies
     character_movies
   end


  def film_info(movie_list)
    movie_list_details =[]
    movie_list.map do |url|
     movie_list_details.push(JSON.parse(RestClient.get(url)))
   end
   movie_list_details
 end

  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.


def parse_character_movies(movie_details)
  # some iteration magic and puts out the movies in a nice list
  movie_details.each do |movie|
    puts movie["title"]
  end
end

def parse_movie_details(movie_details,title, movie_feature)
  # some iteration magic and puts out the movies in a nice list
  movie_details.each do |movie|
    if movie["title"] == title
      puts movie["movie_feature"]
    end
  end
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  movie_details = film_info(films_hash)
  parse_character_movies(movie_details)
end


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
