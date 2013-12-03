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
  Student.create!(name: name, email: email, nickname: nickname, password:"budapesten")
end

Task.delete_all
task_list = [
  [ "First", 2 ,true],
  [ "Second", 3, false],
  [ "Third", 1, false],
  [ "Fourth", 3, false]
]

Work.delete_all

task_list.each do |description, points, business|
  work = Work.create
  task = Task.create( description: description, points: points, business: business )
  student = Student.first
  student.works << work
  student.save
  work.task = task
  work.save
end

Teacher.delete_all
Teacher.create!(email: "admin@admin.hu", password: "adminadmin")
