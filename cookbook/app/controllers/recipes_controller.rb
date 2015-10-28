class RecipesController < ApplicationController
 #index
  get '/recipe' do
    @recipes = Recipe.all
  end
  #show individual
  get '/recipe/view/:id' do
    @recipe = Recipe.find(params[:id])
    erb(:"recipes/view")
  end
  #edit page
  get '/recipe/edit/:id' do
    @recipe = Recipe.find(params[:id])
    @courses = Course.all
    erb(:"recipes/edit")
  end
  #new
  get '/recipe/add' do
    @courses = Course.all
    erb(:"recipes/add")
  end
  #update
  put '/recipe/edit/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update_attributes(params[:recipe])
    @ingredients = params[:ingredients].split
    @course = Course.find_by title: params[:course]
    @recipe.course = @course
    @recipe.save

    @recipe.ingredients = []

    @ingredients.each do |ingredient|
      @cap_ingredient = ingredient.capitalize
      @search_ingredient = Ingredient.find_by name:@cap_ingredient
      if !@search_ingredient
        add_ingredient = Ingredient.create(name: @cap_ingredient)
        @recipe.ingredients << add_ingredient
      else
        @recipe.ingredients << @search_ingredient
      end
    end
    redirect("/recipe/")
  end
  #
  #post
  post '/recipe/add' do
    @ingredients = params[:ingredients].split
    @recipe = Recipe.create(params[:recipe])
    @course = Course.find_by title: params[:course]
    @recipe.course = @course
    @recipe.save


    @ingredients.each do |ingredient|
      @cap_ingredient = ingredient.capitalize
      @search_ingredient = Ingredient.find_by name:@cap_ingredient
      if !@search_ingredient
        add_ingredient = Ingredient.create(name: @cap_ingredient)
        @recipe.ingredients << add_ingredient
      else
        @recipe.ingredients << @search_ingredient
      end
    end
    redirect("/recipe/")
  end

  #destroy
  delete '/recipe/:id' do
    Recipe.delete(params[:id])
    redirect("/recipe/")
  end
end

end
