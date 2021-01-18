def s_to_d(string)
  string.gsub(/[^\d.]/, '').to_d
end

def create_ingredient(html_file)
  doc = Nokogiri::HTML(html_file)
  puts 'Document ready'

  ing = Ingredient.new(
    name: doc.search('h1').text,
    kcal: s_to_d(doc.search('.color_cal').text),
    carbs: s_to_d(doc.search('tr:nth-child(6) td b').text),
    total_fat: s_to_d(doc.search('tr:nth-child(1) td b').text),
    saturated_fat: s_to_d(doc.search('tr:nth-child(2) td b').text),
    protein: s_to_d(doc.search('.thick-end td b').text),
    sodium: s_to_d(doc.search('.thin-end~ .thin-end+ .thin-end td+ td').text)
  )
  ing.save(validate: false)

  puts "#{Ingredient.last.name} created"
end
