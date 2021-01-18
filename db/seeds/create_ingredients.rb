require_relative 'create_ingredient'

def create_ingredients(ing_list, scrape_url)
  ing_list.each do |ing|
    url = scrape_url + ing

    begin
      html_file = RestClient.get(url)
    rescue RestClient::InternalServerError
      next
    end

    create_ingredient(html_file)
    sleep(10)
  end
end
