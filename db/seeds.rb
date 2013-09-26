# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

<<<<<<< HEAD
fnames = ["Adam", "Benjamin", "Caleb", "Daniel", "Frank", "Gideon"]
lnames = ["Smith", "Jones", "Washington", "Jefferson", "Gardener", 
"Cooper"]
Student.delete_all
10.times do
  nickname = fnames[rand(6)]
  name = nickname + lnames[rand(6)]
  email = name + "@foobar.com"
  Student.create(name: name, email: email, nickname: nickname)
end


=======
task_list = [
  [ "First", 540 ],
  [ "Second", 850 ],
  [ "Third", 905 ],
  [ "Fourth", 80000 ]
]

task_list.each do |description, points|
  Country.create( description: description, points: points )
end
>>>>>>> 413d0d73c5d5ca3f0391c3c143a73b486d8ac706
