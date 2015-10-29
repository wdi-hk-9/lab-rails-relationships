class RecipesController < ApplicationController
  before_action :set_course
  before_action :get_recipe_id, only: [:show, :edit, :update, :destroy]

  def index
    # binding.pry
    @recipes = @course.recipes
    # if @recipes.course_id == null
    #   redirect_to course_url
    # elsif @recipes.course_id != null
    #   redirect_to course_recipes_url
    # end

  end

  def show
  end

  def new
    @recipe = @course.recipes.new
  end

  def edit
  end

  def create
    @recipe = @course.recipes.new(recipe_params)
    if @recipe.save
      redirect_to course_recipe_path(@recipe.course_id, @recipe.id)
    end
  end

  def update
    @recipe.update(recipe_params)
    redirect_to course_recipe_path(@recipe.course_id, @recipe.id)
  end

  def destroy
    @recipe.destroy
    redirect_to course_recipes_path(@recipe.course_id)
  end

  private
  def set_course
    @course = Course.find(params[:course_id])
  end

  def get_recipe_id
    @recipe = @course.recipes.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:id, :name, :description, :servings, :course_id)
  end

end