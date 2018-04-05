class CategoriesController < ApplicationController

  include Secured

  before_action :set_category, only: [:destroy, :update, :edit]
  before_action :logged_in?
  before_action  {valid_action(0)}


    def create
        @category = Category.new(category_params)
        respond_to do |format|
        if @category.save
            format.html do
            redirect_to '/categories', notice: 'Category was successfully created.'
           end
        else
       format.html { render :new, status: 422 }
       format.json { render json: @category.errors, status: :unprocessable_entity }
       end
       end
    end
    
    def edit; end

    def update
      respond_to do |format|
      if @category.update(category_params)
        format.html do
          redirect_to '/categories', notice: 'Category was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
    end

    def destroy
        @category.destroy
        flash[:success] = "Category deleted"
        redirect_to '/categories'
    end

    def index
        @categories = Category.all
        @category = Category.new
    end 

    private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
        params.require(:category).permit(:name,:description)
    end

end


