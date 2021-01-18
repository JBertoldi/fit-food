require_relative 'scrape_ingredient_names'
require_relative 'filter_groups'
require_relative 'filter_ingredients'
require_relative '../create_ingredient'

after 'production:users' do
  # puts 'Destroying ingredients..'
  # Ingredient.destroy_all

  scrape_url = ENV['SCRAPE_URL']

  groups_selector = '.all_food_group_name a'
  ingredients_selector = '.li_no_litera a , .li_litera+ a'
  food_groups = []
  ingredients_list = []

  css_sel = {
    name: 'h1',
    kcal: '.color_cal',
    carbs: 'tr:nth-child(6) td b',
    fat: 'tr:nth-child(1) td b',
    sat_fat: 'tr:nth-child(2) td b',
    prot: '.thick-end td b',
    sodium: '.thin-end~ .thin-end+ .thin-end td+ td'
  }

  puts 'Getting ingredient groups list..'
  scrape_names(scrape_url, groups_selector, food_groups)
  sleep(rand(6))

  filter_groups(food_groups)

  puts 'Getting ingredient list..'

  food_groups.each do |food_group|
    url = "#{scrape_url}#{food_group}-group"
    puts "----- #{food_group} -----"

    scrape_names(url, ingredients_selector, ingredients_list)
    sleep(rand(6))
  end

  filtered_ing_list = filter_ings(ingredients_list).uniq

  puts '######## Filtered ingredient list: ##########'
  existing_ings = Ingredient.count

  filtered_ing_list.shift(existing_ings)
  filtered_ing_list.each { |ing| puts ing }

  puts "Total ings: #{filtered_ing_list.count} "

  puts 'Creating ingredients..'

  filtered_ing_list.each do |ing|
    url = scrape_url + ing

    begin
      html_file = RestClient.get(url)
    rescue RestClient::InternalServerError
      next
    end

    create_ingredient(html_file, css_sel)
    sleep(10)
  end
end
