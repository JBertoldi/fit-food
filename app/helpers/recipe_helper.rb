module RecipeHelper
  def author?
    current_user.id == @recipe.user_id unless current_user.nil?
  end

  def favourited?
    current_user.favourited?(@recipe)
  end

  def edit_ico
    "<i class='far fa-edit'></i>".html_safe
  end

  def delete_ico
    '<i class="fas fa-trash"></i>'.html_safe
  end
end
