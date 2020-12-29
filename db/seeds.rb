puts 'Destroying recipes..'
Recipe.destroy_all

puts 'Destroying ingredients..'
Ingredient.destroy_all

puts 'Creating ingredients..'
50.times do
  Ingredient.create!(
    name: Faker::Food.unique.ingredient,
    kcal: rand(5..300),
    carbs: rand(5..50),
    total_fat: rand(5..20),
    saturated_fat: rand(0.5..5).round(2),
    protein: rand(0.5..20).round(2),
    salt: rand(0.1..2).round(2)
  )
end

puts 'Creating recipes..'

30.times do
  recipe = Recipe.create!(
    name: Faker::Food.unique.dish,
    instructions: Faker::Food.description,
    difficulty: %w[Easy Medium Hard].sample,
    preparation_time: rand(100),
    cooking_time: rand(100),
    user_id: 1
  )

  rand(3..8).times do
    Dose.create!(
      amount: rand(0.1..1.5).round(2),
      description: Faker::Verb.past,
      ingredient_id: Ingredient.pluck(:id).sample,
      recipe_id: recipe.id
    )
  end

  recipe.save
end

puts 'Done! :D'
