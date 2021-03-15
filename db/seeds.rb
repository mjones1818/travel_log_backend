User.destroy_all
Trip.destroy_all
ActiveStorage::Attachment.all.each { |attachment| attachment.purge }
ActiveStorage::Blob.all.each {|blob| blob.purge}

trip = Trip.create(country:'Thailand', text:'Went here in 2017')
trip2 = Trip.create(country:'Portugal', text:'Went here in 2020')
trip_description = 'Alfama, Sé, Graça & Castelo
Alfama is in essence a labyrinth of steep cobblestone streets who up until recent years were the most traditional part of the city. These days, every other door is an Airbnb apartment, but somehow the essence still lingers by. Great neighborhood to get beautifully lost and find kids playing soccer, neighbours chit chatting or putting the laundry out to dry.

Many places worth to visit in the surroundings. Sé Catedral and one of the many miradouros (viewpoints). My favorite are Miradouro da Nossa Senhora do Monte and Miradouro Portas do Sol with its absolutely gorgeous panoramic views facing east and southwest of the city, respectively. Both are great places to grab a cup of wine and take it all in. 
  Chiado is the elegant and artsy district, beloved by many poets and writers. Place of theaters, old bookshops and fancy restaurants, you can find a real-sized statue of Fernando Pessoa in A Brasileira, one of Chiado’s century-old cafés.

Most of this bustling area was destroyed in a massive fire in 1988 but has since been reborn. Together with Avenida da Liberdade, Rua Garrett holds the title for the more expensive real estate of Lisbon.'
hipster_string = 'Im baby vexillologist cardigan VHS palo santo viral dreamcatcher four loko man braid schlitz beard ennui crucifix letterpress Jianbing tousled yr etsy tacos four dollar toast schlitz pour-over seitan adaptogen bushwick Pork belly vice swag godard, woke chartreuse tumblr cornhole roof party hashtag next level cray Flexitarian raw denim food truck twee literally vegan glossier'
names = hipster_string.split(' ')
profile_pics = ['profile','profile_test']
names.each do |name|
  profile_pic = profile_pics.sample
  new_user = User.create(name:name, password:'test')
  new_user.profile.attach(
    io: File.open("./public/pics/#{profile_pic}.jpeg"),
    filename: "#{profile_pic}.jpeg",
    content_type: 'application/jpeg'
  )
  rand(1..10).times do 
    country = ['Thailand','Portugal'].sample
    new_trip = Trip.create(country:"#{country}", text: trip_description)
    new_user.trips << new_trip
    new_trip.images.attach(
      io: File.open("./public/pics/#{country.downcase}.jpeg"),
      filename: "#{country.downcase}.jpeg",
      content_type: 'application/jpeg'
    )
    new_trip.images.attach(
      io: File.open("./public/pics/#{country.downcase} 2.jpeg"),
      filename: "#{country.downcase} 2.jpeg",
      content_type: 'application/jpeg'
    )
  end
  # country = ['Thailand','Portugal'].sample
  # new_trip = Trip.create(country:"#{country}", text:'Went here in 2017')
  # new_user.trips << new_trip
  # new_trip.images.attach(
  #   io: File.open("./public/pics/#{country.downcase}.jpeg"),
  #   filename: "#{country.downcase}.jpeg",
  #   content_type: 'application/jpeg'
  # )
  # new_trip.images.attach(
  #   io: File.open("./public/pics/#{country.downcase} 2.jpeg"),
  #   filename: "#{country.downcase} 2.jpeg",
  #   content_type: 'application/jpeg'
  # )
end

# mike = User.create(name:'Mike', password:'test')

# mike.trips << trip
# trip.images.attach(
#   io: File.open('./public/pics/thailand.jpeg'),
#   filename: 'thailand.jpeg',
#   content_type: 'application/jpeg'
# )

# trip.images.attach(
#   io: File.open('./public/pics/thailand 2.jpeg'),
#   filename: 'thailand 2.jpeg',
#   content_type: 'application/jpeg'
# )

# mike.profile.attach(
#   io: File.open('./public/pics/profile.jpeg'),
#   filename: 'profile.jpeg',
#   content_type: 'application/jpeg'
# )