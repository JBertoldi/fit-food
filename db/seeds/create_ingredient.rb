def s_to_d(string)
  string.gsub(/[^\d.]/, '').to_d
end

def create_ingredient(url, css_sel)
  html_file = RestClient.get(url)
  doc = Nokogiri::HTML(html_file)
  puts 'Document ready'

  Ingredient.create!(
    name: doc.search(css_sel[:name]).text,
    kcal: s_to_d(doc.search(css_sel[:kcal]).text),
    carbs: s_to_d(doc.search(css_sel[:carbs]).text),
    total_fat: s_to_d(doc.search(css_sel[:fat]).text),
    saturated_fat: s_to_d(doc.search(css_sel[:sat_fat]).text),
    protein: s_to_d(doc.search(css_sel[:prot]).text),
    sodium: s_to_d(doc.search(css_sel[:sodium]).text)
  )
  puts "#{Ingredient.last.name} created"
end
