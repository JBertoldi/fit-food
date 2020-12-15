module MacrosHelper
  def format_name(name)
    if name == 'total_fat'
      name.sub('total_','')
    elsif name == 'saturated_fat'
      name.sub('urated_',' ')
    else
      name
    end
  end

  def format_amount(amount)
    amount.to_i * 100
  end

  def format_value(value)
    value.round
  end

  def format_macro(name, val)
    name == 'kcal' ? val.to_d.round : val
  end

  def calc_macro(dose, name, val)
    val = dose.amount * val.to_d
    format_macro(name, val)
  end

  def macros_json(macro_list)
    macro_list.as_json(only: %i[kcal carbs total_fat saturated_fat protein salt])
  end
end
