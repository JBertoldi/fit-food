class Dose < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  validates :amount, numericality: { greater_than: 0, message: 'Please enter a number greater than 0.' }
  validates :description, length: { maximum: 50, message: 'Please write a description with up to 50 characters' }

  after_save :increment_recipe_macros!
  before_destroy :decrement_recipe_macros!

  private

  def calc(macro)
    self.amount * macro
  end

  def decrement_recipe_macros!
    recipe = self.recipe
    ing = self.ingredient
    recipe.kcal -= calc(ing.kcal)
    recipe.carbs -= calc(ing.carbs)
    recipe.total_fat -= calc(ing.total_fat)
    recipe.saturated_fat -= calc(ing.saturated_fat)
    recipe.protein -= calc(ing.protein)
    recipe.salt -= calc(ing.salt)
    recipe.save
  end

  def increment_recipe_macros!
    recipe = self.recipe
    ing = self.ingredient
    recipe.kcal += calc(ing.kcal)
    recipe.carbs += calc(ing.carbs)
    recipe.total_fat += calc(ing.total_fat)
    recipe.saturated_fat += calc(ing.saturated_fat)
    recipe.protein += calc(ing.protein)
    recipe.salt += calc(ing.salt)
    recipe.save
  end
end
