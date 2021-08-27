require 'open-uri'
require 'rest-client'
require 'json'
Book.destroy_all
User.destroy_all
################# USERS SEED ###################
puts 'Creating users ...'
url = 'https://randomuser.me/api/?results=5&nat=us&inc=name,location,email,picture'
 response = RestClient.get(url)
 repos = JSON.parse(response)['results']
repos.each do |person|
  User.create!(first_name: person['name']['first'],
               last_name: person['name']['last'],
               address: "#{person['location']['street']['number']} #{person['location']['street']['name']}" ,
               email: person['email'],
               password: '123123')
end
puts ' Users created!'

#################### BOOKS SEED ########################

puts 'Creating books ...'

Book.create(title: "Tears in the Fabric of the Universe",
             author: "Patrick Astre",
             price: 4.23,
             description: "A petty crook discovers he can stop time. A Vietnam Vet searching for redemption finds ancient evil.",
             user: User.first)

Book.create(title: "The Moonlight Child",
             author: "Karen McQuestion",
             price: 4.94,
             description: "On a cold January night, Sharon Lemke heads outside to see a lunar eclipse when she notices something odd at the house behind her backyard. ",
             user: User.first)

Book.create(title: "The Noise",
             author: "Patrick Astre",
             price: 4.23,
             description: "In the shadow of Mount Hood, sixteen-year-old Tennant is checking rabbit traps with her eight-year-old sister Sophie when the girls are suddenly overcome by a strange vibration rising out of the forest, building in intensity until it sounds like a deafening crescendo of screams.",
             user: User.first)

Book.create(title: "Blind Tiger",
             author: "Sandra Brown",
             price: 14.99,
             description: "Thatcher Hutton, a war-weary soldier on the way back to his cowboy life, jumps from a moving freight train to avoid trouble . . . and lands in more than he bargained for.",
             user: User.first)

Book.create(title: "Atomic Habits",
             author: "James Clear",
             price: 12.99,
             description: "No matter your goals, Atomic Habits offers a proven framework for improving every day.",
             user: User.first)

Book.create(title: "The Body Keeps the Score",
             author: "Bessel van der Kork",
             price: 9.99,
             description: "The Body Keeps the Score exposes the tremendous power of our relationships both to hurt and to heal—and offers new hope for reclaiming lives.",
             user: User.first)

Book.create(title: "The Body Keeps the Score",
             author: "Bessel van der Kork",
             price: 9.99,
             description: "The Body Keeps the Score exposes the tremendous power of our relationships both to hurt and to heal—and offers new hope for reclaiming lives.",
             user: User.first)

Book.create(title: "American Marxism",
             author: "Mark R. Levin",
             price: 17.81,
             description: "n American Marxism, Levin explains how the core elements of Marxist ideology are now pervasive in American society and culture",
             user: User.first)

Book.create(title: "Once There Were Wolves",
             author: "Charlotte McConaghy ",
             price: 14.27,
             description: "nti Flynn arrives in Scotland with her twin sister, Aggie, to lead a team of biologists tasked with reintroducing fourteen gray wolves into the remote Highlands.",
             user: User.first)

Book.create(title: "Maybe You Should Talk to Someone",
             author: "Lori Gottlieb",
             price: 11.74,
             description: "One day, Lori Gottlieb is a therapist who helps patients in her Los Angeles practice. The next, a crisis causes her world to come crashing down.",
             user: User.first)

puts 'Books created!'
