require 'googlecharts'

class StudentsController < ApplicationController

  # GET /users
  # GET /users.json
  def index
    @students = Student.all
    @tasks = Task.all
  end

  def show
    @student = Student.friendly.find(params[:id])
  end

  def stats
    @students = Student.all
    @student_points = Gchart.radar(
                        data: @students.map{|stud| stud.works.inject(0){|m,w| m + w.task.points} },
                        labels: @students.map(&:nickname),
                        #legend: @students.map(&:name),
                        size: '600x500'
    )
    @student_points2 = Gchart.pie(
        data: @students.map{|stud| stud.works.inject(0){|m,w| m + w.task.points} },
        #labels: @students.map(&:name),
        legend: @students.map(&:nickname),
        theme: :thirty7signals,
        size: '600x500'
    )
    data = @students.map{|stud| [stud.works.inject(0){|m,w| m + w.task.points}, stud.nickname] }.group_by{|x| x.first }.values
    @line_chart = Gchart.bar(
        data: data.map{|a| a.first.first},
        legend: data.map{|a| a.first.first.to_s + ': ' + a.inject(''){|m,n| m + n.last + ', '}},
        size: '600x500'
    )
  end
end
