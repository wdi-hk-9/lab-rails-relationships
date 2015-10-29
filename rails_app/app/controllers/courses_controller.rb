class CoursesController < ApplicationController
 before_action :set_course_id, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.all
  end

  def show
  end

  def new
    @course = Course.new
  end

  def edit
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to @course
    end
  end

  def update
    @course.update(course_params)
    redirect_to @course
  end

  def destroy
    @course.destroy
    redirect_to courses_url
  end

  private
  def set_course_id
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:id, :name, :course_id)
  end

end
