class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(recipe_id: @recipe.id)
    @recipe.ingredients.build(recipe_id: @recipe.id)

  end

  def create

    @recipe = Recipe.create(recipe_params(:title,
      ingredients_attributes:[
        :name,
        :quantity
      ]
      ))
      
      redirect_to recipe_path(@recipe)
  end


  private

  def recipe_params(*args)
    params.require(:recipe).permit(*args)
  end
end
