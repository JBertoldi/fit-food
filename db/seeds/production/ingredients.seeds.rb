require_relative 'scrape_ingredient_names'
require_relative 'filter_groups'
require_relative 'filter_ingredients'
require_relative '../create_ingredients'

after 'production:users' do
  puts 'Destroying ingredients..'
  Ingredient.destroy_all

  scrape_url = ENV['SCRAPE_URL']

  groups_selector = '.all_food_group_name a'
  ingredients_selector = '.li_no_litera a , .li_litera+ a'
  food_groups = []
  ingredients_list = []

  puts 'Getting ingredient groups list..'
  scrape_names(scrape_url, groups_selector, food_groups)
  filter_groups(food_groups)

  puts 'Getting ingredient list..'

  food_groups.each do |food_group|
    url = "#{scrape_url}#{food_group}-group"
    puts "----- #{food_group} -----"

    scrape_names(url, ingredients_selector, ingredients_list)
  end

  filtered_ing_list = filter_ings(ingredients_list).uniq

  puts '---------- Filtered ingredient list: ----------'
  filtered_ing_list.each { |ing| puts ing }

  puts "Total ings: #{filtered_ing_list.count} "
  puts 'Creating ingredients..'
  create_ingredients(filtered_ing_list, scrape_url)
end
