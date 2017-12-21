class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
    @recipe.ingredients.build
  end

  def create
    @recipe = Recipe.new(recipes_params)
    if @recipe.valid?
      @recipe.save
      redirect_to recipe_path(@recipe)
    else
      flash[:error] = @recipe.errors.full_messages
      redirect_to new_recipe_path
    end
  end

  private
    def recipes_params
      params.require(:recipe).permit(:title, ingredients_attributes: [:name, :quantity])
    end
end
