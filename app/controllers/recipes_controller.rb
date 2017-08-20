class RecipesController < ApplicationController

  before_action :find_recipes, only: [:edit, :update]
  # before_action :get_ingredients

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to recipes_path
    else
      render :new
    end

  end

  def edit
  end

  def update
    @recipe.update(recipe_params)

    if @recipe.save
      redirect_to recipes_path
    else
      render :edit
    end

  end

  def index
    @recipes = Recipe.all 
  end

  # def show
  # end

  private
    def find_recipes
      @recipe = Recipe.find(params[:id])
    end

    # def get_ingredients
    #   @ingredient = Ingredient.all
    # end

    def recipe_params
      params.require(:recipe).permit(:name)
    end

end
