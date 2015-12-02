module ApplicationHelper
  def admin?
    if user_signed_in?
      current_user.admin == true
    end
  end

  def category?
    @category && @category.id != nil
  end
end
