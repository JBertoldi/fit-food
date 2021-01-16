def filter_groups(food_groups)
  food_groups.delete_if { |group| group.include?('baby-foods') || group.include?('fish-and-seafood') }
  food_groups.push('finfish-and-seafood')
end
