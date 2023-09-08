# install gazpacho library
!pip install gazpacho

## import function
from gazpacho import Soup
import requests

# IMDB website
url = "https://www.imdb.com/search/title/?groups=top_100&sort=user_rating,desc"
html = requests.get(url)

imdb = Soup(html.text)

# Movie Rate Type
rate_types = imdb.find("span", {"class": "certificate"})
clean_rate_types = [rate_type.strip() for rate_type in rate_types]

# Movie Length
lengths = imdb.find("span", {"class": "runtime"})
clean_lengths = [length.strip() for length in lengths]

# Movie Genre
genres = imdb.find("span", {"class": "genre"})
clean_genres = [genre.strip() for genre in genres]

# Movie Rating
ratings = imdb.find("div", {"class": "ratings-imdb-rating"})
clean_ratings = [float(rating.strip()) for rating in ratings]

# # Movie Release Year
years = imdb.find("span", {"class": "lister-item-year"})
clean_years = [int(year.strip().replace('(','').replace(')','')) for year in years]

# create DataFrame
import pandas as pd

# movie_database
movie_db = pd.DataFrame(data ={
    "Title": clean_titles,
    "Rate_type": clean_rate_types,
    "Length": clean_lengths,
    "Genre": clean_genres,
    "Rating": clean_ratings,
    "Released Year": clean_years
    })

movie_db.head()
