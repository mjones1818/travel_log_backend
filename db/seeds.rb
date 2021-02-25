User.destroy_all
Trip.destroy_all

mike = User.create(name:'Mike', password:'test')
trip = Trip.create(country:'Thailand')
mike.trips << trip
trip.images.attach(
  io: File.open('./public/pics/thailand.jpeg'),
  filename: 'thailand.jpeg',
  content_type: 'application/jpeg'
)

mike.profile.attach(
  io: File.open('./public/pics/profile.jpeg'),
  filename: 'profile.jpeg',
  content_type: 'application/jpeg'
)