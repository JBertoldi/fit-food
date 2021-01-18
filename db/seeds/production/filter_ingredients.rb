def allowed_double_word(ing)
  (ing.include?('seeds') || ing.match?(/-oil\z/) || ing.match?(/-milk\z/)) && ing.split('-').count <= 2
end

def allowed_triple_word(ing)
  ing.include?('beans' && 'canned') && ing.split('-').count <= 3
end

def filter_ings(ings)
  ings.delete_if do |ing|
    next if allowed_double_word(ing)
    next if allowed_triple_word(ing)

    ing.split('-').count > 1
  end
end
