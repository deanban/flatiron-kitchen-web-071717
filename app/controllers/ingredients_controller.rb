class IngredientsController < ApplicationController

  before_action :find_ingredients, only: [:edit, :update]
  
  def index
    @ingredients = Ingredient.all 
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingred_params)

    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render :new
    end
  end

  def edit

  end

  def update
    @ingredient.update(ingred_params)
    
    if @ingredient.save
      redirect_to ingredients_path
    else
      render :edit
    end
  end

  # def show

  # end

  private
    
    def find_ingredients
      @ingredient = Ingredient.find(params[:id])
    end

    def ingred_params
      params.require(:ingredient).permit(:name)
    end

end
