require_relative '../create_ingredient'

after 'development:users' do
  puts 'Destroying ingredients..'
  Ingredient.destroy_all

  css_sel = {
    name: 'h1',
    kcal: '.color_cal',
    carbs: 'tr:nth-child(6) td b',
    fat: 'tr:nth-child(1) td b',
    sat_fat: 'tr:nth-child(2) td b',
    prot: '.thick-end td b',
    sodium: '.thin-end~ .thin-end+ .thin-end td+ td'
  }

  ings = %w[low-fat-cheese almonds basil dandelion-greens]
  scrape_url = ENV['SCRAPE_URL']

  puts 'Creating ingredient..'
  ings.each do |ing|
    url = scrape_url + ing
    create_ingredient(url, css_sel)
    sleep(rand(6))
  end
end
