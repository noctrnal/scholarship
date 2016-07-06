# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(:email => 'user@example.com', :password => 'password')

[
  'Art Therapy',
  'Audiology',
  'Clinical Psychology',
  'Counseling',
  'Deaf Education',
  'Education Psychology',
  'Education Specialist',
  'Education Technology',
  'Guidance',
  'Music Therapy',
  'Occupational Therapy',
  'Orientation and Mobility Education',
  'Pediatric Physical Therapy',
  'Psychology',
  'Psychometry',
  'Reading Specialist',
  'Recreation Therapy',
  'Social Work',
  'Speical Education (all areas)',
  'Speech, Hearing, or Language Pathology',
  'Other',
].each do |field|
  Field.create(:name => field)
end

[
  'Masters',
  'Doctorate',
  'Other',
].each do |degree|
  Degree.create(:name => degree)
end

