# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

fnames = ["Adam", "Benjamin", "Caleb", "Daniel", "Frank", "Gideon"]
lnames = ["Smith", "Jones", "Washington", "Jefferson", "Gardener", 
"Cooper"]
Student.delete_all
3.times do
  nickname = fnames[rand(6)]
  name = nickname + " " + lnames[rand(6)]
  email = (name + "@foobar.com").gsub(" ", "")
  Student.create(name: name, email: email, nickname: nickname)
end


task_list = [
  [ "First", 540 ],
  [ "Second", 850 ],
  [ "Third", 905 ],
  [ "Fourth", 80000 ]
]

task_list.each do |description, points|
  Task.create( description: description, points: points )
end

Teacher.create(email: "admin@admin.hu", password: "adminadmin")
