def url_string(string)
  # Sub due to 'Soups, Sauces, and Gravies' => 'soups-sauces-gravies' but 'Fats and Oils' => 'fats-and-oils'
  string.include?(',') ? string = string.sub(' and', '').split(', ').join(' ') : string

  # Gsub due to strings like 'Cockles (Alaska Native)'
  string.downcase.gsub(/[^0-9A-Za-z]/, ' ').split.join('-')
end

def scrape_names(url, selector, variable)
  html_file = RestClient.get(url)
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search(selector).each do |element|
    variable << url_string(element.text)
    puts variable.last
  end
  sleep(rand(6))
end
