# Order list 

# list = {
#   "China" => "54,32,44",
#   "Korea" => "55,33,45",
#   "Iraq" => "54,33,45",
#   "Iran" => "54,33,45",
#   "Norway" => "56,32,45",
#   "Finland" => "55,34,45"
# }

# Test.describe 'First test' do
#   list =  {"China" => "54,32,45",
#           "Korea" => "55,32,45",
#           "Iran" => "54,33,45",
#           "Iraq" => "54,32,46",
#           "Chinb" => "54,32,45",
#           "Ahina" => "54,32,45"}
#   Test.assert_equals order_countries(list), "Korea-Iran-Iraq-Ahina-China-Chinb"
# end


$result = []

def order_countries(list_of_countries = {})
  sorted_list_by_medals = list_of_countries.sort { |a, b| b[1].split(",").map(&:to_i) <=> a[1].split(",").map(&:to_i) }.reverse
  $result = sorted_list_by_medals.to_h.keys
  
  sorted_list_by_medals.each { |country, medals|
    determine_order_by_country(country, medals, sorted_list_by_medals)
  }
  $result.reverse.inject { |total, country| total = total + "-" + country }
end

def determine_order_by_country(selected_country, selected_country_medals, sorted_list)
   sorted_list.each { |country, medals|
     if country == selected_country
       next
     end
     
     if order_medals_are_same(selected_country_medals.split(",").map(&:to_i), medals.split(",").map(&:to_i))
       order_by_country_and_swop_positions(selected_country, country)
     end
   }
end

def order_medals_are_same(selected_country_medals, country_medals)
    selected_country_medals.zip(country_medals).all? { |a, b| a == b } # medals are the same count
end

def order_by_country_and_swop_positions(selected_country, country_with_same_medal_count)
       index_selected = $result.find_index(selected_country)
       index_same_medal = $result.find_index(country_with_same_medal_count)
       if (selected_country > country_with_same_medal_count && index_selected > index_same_medal)
         $result[index_selected], $result[index_same_medal] = $result[index_same_medal], $result[index_selected] 
       end
end

#### A More Efficient Way Than All of This:
# Cut n Paste from CodeWars (credit to UrNotSorry)
def order_countries(list_of_countries = {})
  list_of_countries.sort_by {|name, values|
    values.split(',').map {|num| - num.to_i } + [name]
  }.map {|name, values| name }.join('-')
end