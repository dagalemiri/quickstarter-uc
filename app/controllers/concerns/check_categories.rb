module CheckCategories
  extend ActiveSupport::Concern

  def is_checked?(category)
    return false unless @user.categories.include?(category)
    return true
  end
  def is_checked_project?(category)
    return false unless @project.categories.include?(category)
    return true
  end


end
