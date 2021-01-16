class Dose < ApplicationRecord
  # searchkick

  belongs_to :recipe
  belongs_to :ingredient

  after_commit :reindex_recipe

  validates :amount, numericality: { greater_than: 0 }
  validates :description, length: { maximum: 50 }

  after_save :increment_recipe_macros!
  before_destroy :decrement_recipe_macros!

  private

  def reindex_recipe
    recipe.reindex
  end

  def calc(macro)
    amount * macro
  end

  def decrement_recipe_macros!
    recipe.kcal -= calc(ingredient.kcal)
    recipe.carbs -= calc(ingredient.carbs)
    recipe.total_fat -= calc(ingredient.total_fat)
    recipe.saturated_fat -= calc(ingredient.saturated_fat)
    recipe.protein -= calc(ingredient.protein)
    recipe.sodium -= calc(ingredient.sodium)
    recipe.save
  end

  def increment_recipe_macros!
    recipe.kcal += calc(ingredient.kcal)
    recipe.carbs += calc(ingredient.carbs)
    recipe.total_fat += calc(ingredient.total_fat)
    recipe.saturated_fat += calc(ingredient.saturated_fat)
    recipe.protein += calc(ingredient.protein)
    recipe.sodium += calc(ingredient.sodium)
    recipe.save
  end
end
