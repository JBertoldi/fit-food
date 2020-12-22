module MacrosHelper
  def format_name(name)
    case name
    when 'total_fat' then name.sub('total_', '').upcase
    when 'saturated_fat' then name.sub('urated_', ' ').upcase
    else name.upcase
    end
  end

  def format_amount(amount)
    (amount * 100).to_i
  end

  def format_value(value)
    value.round
  end

  def format_macro(name, val)
    name == 'kcal' ? val.to_d.round : val.to_s.sub(/.0\z/, '')
  end

  def calc_macro(dose, name, val)
    val = dose.amount * val.to_d
    format_macro(name, val)
  end

  def macros_json(macro_list)
    macro_list.as_json(only: %i[kcal carbs total_fat saturated_fat protein salt])
  end
end
