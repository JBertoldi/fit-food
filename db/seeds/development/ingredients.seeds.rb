require_relative '../create_ingredients'

after 'development:users' do
  puts 'Destroying ingredients..'
  Ingredient.destroy_all

  ings = %w[low-fat-cheese almonds basil dandelion-greens]
  scrape_url = ENV['SCRAPE_URL']

  puts 'Creating ingredients..'
  create_ingredients(ings, scrape_url)
end
