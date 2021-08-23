require 'open-uri'
require 'rest-client'
require 'json'

url = ('https://randomuser.me/api/?results=25&inc=name,email,phone,login,picture&nat=us')

response = RestClient.get(url)
repos = JSON.parse(response)['results']

repos.each do |person|
  file = URI.open('https://thispersondoesnotexist.com/image')
  new_user = Buddy.create(first_name: person['name']['first'],
                          last_name: person['name']['last'],
                          address: person['street']['number']['name']),
                          email: person['email'],
                          password: person['password']
  new_user.photo.attach(io: file, filename: 'new_user.jpg', content_type: 'image/jpg')
end
