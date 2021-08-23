require 'open-uri'
require 'rest-client'
require 'json'


Book.destroy_all
User.destroy_all

url = ('https://randomuser.me/api/?results=1')


 response = RestClient.get(url)
 repos = JSON.parse(response)['results']


repos.each do |person|
  file = URI.open('https://thispersondoesnotexist.com/image')
  new_user = User.create!(first_name: person['name']['first'],
                        last_name: person['name']['last'],
                        address: "#{person['location']['street']['number']} #{person['location']['street']['name']}" ,
                        email: person['email'],
                          password: '123123')
#  new_user.photo.attach(io: file, filename: 'new_user.jpg', content_type: 'image/jpg')
end


uri = URI.parse("https://www.googleapis.com/books/v1/volumes?q=fiction:thriller&key=AIzaSyAeHSvWyROqaqFAQiK_pYDbn4sOe962xPw").read
books = JSON.parse(uri)

books["items"].each do |book|
  author = (book["volumeInfo"] && book["volumeInfo"]["authors"] && book["volumeInfo"]["authors"][0]) ? book["volumeInfo"]["authors"][0] : 'Unknown'
  price = (book["saleInfo"] && book["saleInfo"]["listPrice"] && book["saleInfo"]["listPrice"]["amount"]) ? book["saleInfo"]["listPrice"]["amount"] : 'Unknown'
  Book.create!(title: book["volumeInfo"]["title"],
                author: author,
                price: price,
                description: book["volumeInfo"]["description"],
                user: User.first)
end


