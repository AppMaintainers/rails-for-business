class StudentsController < ApplicationController

  # GET /users
  # GET /users.json
  def index
    @students = Student.all
    @tasks = Task.all
  end

  def show
    @student = Student.find(params[:id])
  end
end
