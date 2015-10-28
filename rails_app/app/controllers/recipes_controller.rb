class RecipesController < ApplicationController
  before_action :set_course
  before_action :get_course_id, only: [:show, :edit, :update, :destroy]

  def index
    # you can inspect with pry here by uncommenting the next line
    # binding.pry
    @recipe = @course.recipes
  end

  def show
  end

  def new
    @recipe = @course.recipes.new
  end

  def edit
  end

  def create
    @recipe = @course.recipes.new(course_params)
    if @recipe.save
      redirect_to course_recipes_url
    end
  end

  def update
    @recipe.update(course_params)
    redirect_to course_recipes_url
  end

  def destroy
    @recipe.destroy
    redirect_to course_recipes_url
  end

  private
  def set_course
    @course = Course.find(params[:course_id])
  end

  def get_recipe_id
    @recipe = @course.recipes.find(params[:id])
  end

  def course_params
    params.require(:recipes).permit(:name, :description, :servings)
  end

end
