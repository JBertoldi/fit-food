def s_to_d(string)
  string.gsub(/[^\d.]/, '').to_d
end

def create_ingredient(html_file, css_sel)
  doc = Nokogiri::HTML(html_file)
  puts 'Document ready'

  ing = Ingredient.new(
    name: doc.search(css_sel[:name]).text,
    kcal: s_to_d(doc.search(css_sel[:kcal]).text),
    carbs: s_to_d(doc.search(css_sel[:carbs]).text),
    total_fat: s_to_d(doc.search(css_sel[:fat]).text),
    saturated_fat: s_to_d(doc.search(css_sel[:sat_fat]).text),
    protein: s_to_d(doc.search(css_sel[:prot]).text),
    sodium: s_to_d(doc.search(css_sel[:sodium]).text)
  )
  ing.save(validate: false)

  puts "#{Ingredient.last.name} created"
end
