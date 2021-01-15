module MacrosHelper
  def format_name(name)
    case name
    when 'total_fat' then name.sub('total_', '').upcase
    when 'saturated_fat' then name.sub('urated_', ' ').upcase
    else name.upcase
    end
  end

  def format_macro(name, val)
    case name
    when 'kcal' then val.to_d.round
    when 'sodium' then "#{val.to_d.round}<small><strong>mg</strong></small>".html_safe
    else "#{val.to_d.round(2).to_s.sub(/.0\z/, '')}<small><strong>g</strong></small>".html_safe
    end
  end

  def macros_json(macro_list)
    macro_list.as_json(only: %i[kcal carbs total_fat saturated_fat protein sodium])
  end

  def format_amount(amount)
    (amount * 100).to_i
  end

  # On doses_new to give the user macronutrient info while creating recipe
  def calc_macro(dose, name, val)
    val = dose.amount * val.to_d
    format_macro(name, val)
  end
end
