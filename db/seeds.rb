# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[
  'Masters',
  'Doctorate',
  'Other',
].each do |degree|
  Degree.create(:name => degree)
end

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
  'Special Education (all areas)',
  'Speech, Hearing, or Language Pathology',
  'Other',
].each do |field|
  Field.create(:name => field)
end

[
  'Outstanding',
  'Very good',
  'Good',
  'Average',
  'Below average',
  'Poor',
  'No basis to evaluate',
].each do |impression|
  Impression.create(:name => impression)
end

[
  'Enthusiastic',
  'With confidence',
  'Recommended',
  'Recommended with reservation',
  'Not recommended',
].each do |rating|
  Rating.create(:name => rating)
end

[
  '2017',
].each do |current_year|
  Setting.create(:current_year => current_year)
end

[
  'Alabama',
  'Arkansas',
  'Florida',
  'Louisiana',
  'Mississippi',
  'Missouri',
  'Tennessee',
].each do |state|
  State.create(:name => state)
end

