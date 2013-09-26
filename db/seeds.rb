# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

task_list = [
  [ "First", 540 ],
  [ "Second", 850 ],
  [ "Third", 905 ],
  [ "Fourth", 80000 ]
]

task_list.each do |description, points|
  Country.create( description: description, points: points )
end
