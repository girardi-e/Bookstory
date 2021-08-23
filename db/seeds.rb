require 'open-uri'
require 'rest-client'
require 'json'

# User.destroy_all

# url = ('https://randomuser.me/api/?results=25')

# response = RestClient.get(url)
# repos = JSON.parse(response)['results']

# repos.each do |person|
#   file = URI.open('https://thispersondoesnotexist.com/image')
#   new_user = User.create!(first_name: person['name']['first'],
#                           last_name: person['name']['last'],
#                           address: "#{person['location']['street']['number']} #{person['location']['street']['name']}" ,
#                           email: person['email'],
#                           password: '123123')
#   # new_user.photo.attach(io: file, filename: 'new_user.jpg', content_type: 'image/jpg')
# end

uri = URI.parse("https://www.googleapis.com/books/v1/volumes?q=fiction:thriller&key=AIzaSyAeHSvWyROqaqFAQiK_pYDbn4sOe962xPw").read
books = JSON.parse(uri)

puts books["items"][0]["volumeInfo"]["title"]
puts books["items"][0]["volumeInfo"]["authors"][0]
puts books["items"][0]["volumeInfo"]["description"]
puts books["items"][0]["saleInfo"]["listPrice"]["amount"]
