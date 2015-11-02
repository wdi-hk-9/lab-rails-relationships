class RecipesController < ApplicationController
  before_action :set_course

  def index
    @recipes = @course.recipes
  end

  def show
    @recipe = @course.recipes.find(params[:id])
  end

  def new
    @recipe = @course.recipes.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
      redirect_to course_recipes_path
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    end
  end

  def destroy
    @recipe.destroy
    redirect_to course_recipe_path(@recipe.course_id)
  end

  private
  def set_course
    @course = Course.find(params[:course_id])
  end

  def recipe_params
      params.require(:recipe).permit(:title, :instructions, :servings, :course_id)
    end
end