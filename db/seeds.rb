puts 'Destroying recipes..'
Recipe.destroy_all

puts 'Destroying ingredients..'
Ingredient.destroy_all

puts 'Creating ingredients..'
50.times do
  Ingredient.create!(
    name: Faker::Food.unique.ingredient, 
    kcal: rand(300), 
    carbs: rand(50), 
    unsaturated_fats: rand(20), 
    saturated_fats: rand(20), 
    protein: rand(20), 
    salt: rand(2)
  )
end

puts 'Creating recipes..'

30.times do
  recipe = Recipe.create!(
    name: Faker::Food.unique.dish,
    instructions: Faker::Food.unique.description,
    kcal: 0, 
    carbs: 0, 
    unsaturated_fats: 0,  
    saturated_fats: 0,  
    protein: 0,  
    salt: 0
  )
  # Must remove not null on nutrient columns to avoid having to create recipe with initial values

  recipe_kcal = 0
  recipe_carbs = 0
  recipe_sat_fats = 0
  recipe_unsat_fats = 0
  recipe_protein = 0
  recipe_salt = 0

  rand(15).times do
    dose = Dose.create!(
        amount: rand(0.01..1.5),
        description: Faker::Verb.past,
        ingredient_id: Ingredient.pluck(:id).sample,
        recipe_id: recipe.id
    )

    ingredient = Ingredient.find(dose.ingredient_id)
    recipe_kcal += ingredient.kcal * dose.amount
    recipe_carbs += ingredient.carbs * dose.amount
    recipe_unsat_fats += ingredient.unsaturated_fats * dose.amount
    recipe_sat_fats += ingredient.saturated_fats * dose.amount
    recipe_protein += ingredient.protein * dose.amount
    recipe_salt += ingredient.salt * dose.amount
  end

  recipe.kcal = recipe_kcal 
  recipe.carbs = recipe_carbs 
  recipe.unsaturated_fats = recipe_unsat_fats
  recipe.saturated_fats = recipe_sat_fats 
  recipe.protein = recipe_protein
  recipe.salt = recipe_salt

  recipe.save
end

puts 'Done! :D'

# 1. Create empty recipe
# 2. Add recipe doses
# 3. Save dose of each ingredient
# 4. Multiply dose amount by ingredient nutrients to get nutrients per amount per ingredient
# 5. Sum nutrients to get recipes total.
# 6. Assign total to recipe

