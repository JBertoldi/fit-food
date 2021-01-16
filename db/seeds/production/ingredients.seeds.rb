require_relative '../scrape_macros'
require_relative 'scrape_ingredient_names'

after 'production:users' do
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
  sleep(rand(10))

  puts 'Food groups done!'

  puts 'Getting ingredient list..'
  food_groups.each do |food_group|
    url = "#{scrape_url}#{food_group}-group"
    puts "--- #{food_group} ingredient list: ---"

    scrape_names(url, ingredients_selector, ingredients_list)
    sleep(rand(6))
  end

  puts 'Creating ingredient..'
  ingredients_list.each do |ing|
    url = scrape_url + ing
    create_ingredient(url, css_sel)
    sleep(rand(6))
  end
end
