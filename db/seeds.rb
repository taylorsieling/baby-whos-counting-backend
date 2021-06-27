# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

taylor = User.create(first_name: "Taylor", last_name: "Sieling", email: "taylorasieling@gmail.com", password: "swiftie")


# Albums
evermore = Album.create(title: "Evermore", release_year: "2020")
folklore = Album.create(title: "Folklore", release_year: "2020")
lover = Album.create(title: "Lover", release_year: "2019")
reputation = Album.create(title: "reputation", release_year: "2017")
eighty_nine = Album.create(title: "1989", release_year: "2014")
red = Album.create(title: "Red", release_year: "2012")
speak_now = Album.create(title: "Speak Now", release_year: "2010")
fearless = Album.create(title: "Fearless", release_year: "2008")
taylor_swift = Album.create(title: "Taylor Swift", release_year: "2006")
from_the_vault = Album.create(title: "From the Vault", release_year: "Varies")
singles = Album.create(title: "Single", release_year: "Varies")

# Evermore

willow = Song.create(title: "willow", length: "3:34", album_id: 1)
champagne_problems = Song.create(title: "champagne problems", length: "4:04", album_id: 1)
gold_rush = Song.create(title: "gold rush", length: "3:05", album_id: 1)
tis_the_damn_season = Song.create(title: "'tis the damn season", length: "3:49", album_id: 1)
tolerate_it = Song.create(title: "tolerate it", length: "4:05", album_id: 1)
no_body_no_crime = Song.create(title: "no body, no crime", length: "3:35", album_id: 1)
happiness = Song.create(title: "happiness", length: "5:15", album_id: 1)
dorothea = Song.create(title: "dorothea", length: "3:45", album_id: 1)
coney_island = Song.create(title: "coney island", length: "4:35", album_id: 1)
ivy = Song.create(title: "ivy", length: "4:20", album_id: 1)
cowboy_like_me = Song.create(title: "cowboy like me", length: "4:35", album_id: 1)
long_story_short = Song.create(title: "long story short", length: "3:35", album_id: 1)
marjorie = Song.create(title: "marjorie", length: "4:17", album_id: 1)
closure = Song.create(title: "closure", length: "3:00", album_id: 1)
evermore = Song.create(title: "evermore", length: "5:04", album_id: 1)
right_where_you_left_me = Song.create(title: "right where you left me - bonus track", length: "4:05", album_id: 1)
its_time_to_go = Song.create(title: "it's time to go - bonus track", length: "4:14", album_id: 1)
