class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.ordered
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)

    if @ingredient.save
      redirect_to ingredients_path # Add anchor to ingredient on the index
    else
      render :new
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :kcal, :carbs, :total_fat, :saturated_fat, :protein, :sodium)
  end
end
