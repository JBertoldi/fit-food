after 'development:ingredients' do
  puts 'Destroying recipes..'
  Recipe.destroy_all

  puts 'Creating recipes..'

  10.times do
    recipe = Recipe.create!(
      user_id: User.pluck(:id).sample,
      name: Faker::Food.unique.dish,
      instructions: Faker::Food.description,
      difficulty: %w[Easy Medium Hard].sample,
      preparation_time: rand(100),
      cooking_time: rand(100),
      published: true
    )
    recipe.photo.attach(io: File.open('app/assets/images/pancake.jpg'), filename: 'pancake.jpg', content_type: 'image/jpg')

    5.times do
      Dose.create!(
        amount: rand(0.1..1.5).round(2),
        description: [Faker::Verb.past, ''].sample,
        ingredient_id: Ingredient.pluck(:id).sample,
        recipe_id: recipe.id
      )
    end

    recipe.save!
  end

  puts 'Recipes created!'
end
