class StudentsController < ApplicationController

  # GET /users
  # GET /users.json
  def index
    @students = Student.all
  end
end
