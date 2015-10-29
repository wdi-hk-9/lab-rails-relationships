class RecipesController < ApplicationController
before_action :set_course

  def index
    @recipes = @course.recipes
  end

  def show
    @recipe = @course.recipes.find(params[:id])
  end

  # create a new recipe that belongs to a course
  def new
    @recipe = @course.recipes.new
  end

  def edit
    @recipe = @course.recipes.find(params[:id])
  end

  def create
    @recipe = @course.recipes.new(recipe_params)
    respond_to do |format|
      if @recipe.save
        format.html { redirect_to course_recipe_path(@recipe.course_id, @recipe.id), notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @recipe = @course.recipes.find(params[:id])
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to course_recipe_path(@recipe.course_id, @recipe.id), notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe = @course.recipes.find(params[:id])
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to course_recipes_path(@recipe.course_id), notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :instructions, :servings, :course_id)
  end

end