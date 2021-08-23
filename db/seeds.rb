require 'open-uri'
require 'rest-client'
require 'json'

User.destroy_all

url = ('https://randomuser.me/api/?results=25')

response = RestClient.get(url)
repos = JSON.parse(response)['results']

repos.each do |person|
  file = URI.open('https://thispersondoesnotexist.com/image')
  new_user = User.create!(first_name: person['name']['first'],
                          last_name: person['name']['last'],
                          address: "#{person['location']['street']['number']} #{person['location']['street']['name']}" ,
                          email: person['email'],
                          password: '123123')
  # new_user.photo.attach(io: file, filename: 'new_user.jpg', content_type: 'image/jpg')
end
