User.destroy_all
Trip.destroy_all

mike = User.create(name:'Mike', password:'test')
trip = Trip.create(country:'Thailand')
mike.trips << trip
trip.images.attach(
  io: File.open('./public/pics/test.jpeg'),
  filename: 'test.jpeg',
  content_type: 'application/jpeg'
)