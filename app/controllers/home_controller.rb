class HomeController < ApplicationController

  include Secured

  def index;
    @categories = Category.all.pluck(:name)
    if current_user
      user = User.find(session[:user_id])
      categories = user.categories
      if categories.count != 0
        @projects_id = []
        categories.each do |cat|
          @projects_id+=cat.projects.pluck(:id)
          @projects = Project.find(@projects_id).shuffle.last(4)

        end

      else
        @projects = nil
      end
    end

  end

end
