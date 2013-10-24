class StudentsController < ApplicationController

  # GET /users
  # GET /users.json
  def index
    @students = Student.all
    @tasks = Task.all
  end
end
