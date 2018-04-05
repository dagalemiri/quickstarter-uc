class UsersController < ApplicationController

  include Secured
  include CheckCategories

  helper_method :valid_action, :is_checked?

  before_action :set_user, only: [:show, :destroy, :edit, :update, :edit_categories, :show_projects]
  before_action :logged_in?, only: [:destroy, :edit, :update, :show_projects]
  before_action only:[:destroy, :edit, :update] {valid_action(params[:id].to_i)}

  def new
    @user = User.new
  end

  def edit;
    @categories = Category.all
    @user_cat = @user.categories
  end

  def index
      if is_admin
        @users = User.all
      else
        redirect_to root_path, notice: "Action not allowed"
      end
  end

  def edit_categories
    @user.categories.clear
    @user.categories << Category.where(name:params["categories"])
    flash[:success] = "Categories updated"
    redirect_to edit_user_path(@user.id)
  end

  def show; end

  def destroy
    if is_admin
      @user.destroy
      redirect_to '/users'
    else
      @user.destroy
      flash[:success] = "User deleted"
      reset_session
      redirect_to root_path
    end
  end

  def create
    @user = User.new(user_params)
    @user.generate_token_and_save

    @user.role = "User"

    respond_to do |format|
     if @user.save
       format.html do
         ExampleMailer.register_email(@user).deliver_later
         redirect_to '/users/new', notice: 'User was successfully created.'
       end
       #format.json { render :show, status: :created, location: @user }
     else
       format.html { render :new, status: 422 }
       format.json { render json: @user.errors, status: :unprocessable_entity }
     end
   end

  end

 def update
   respond_to do |format|
      if @user.update(user_params)
        format.html do
          redirect_to @user, notice: 'User was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
 end

 def show_projects
   if current_user.id == @user.id
     @projects = Project.where(user_id:@user.id)
     p @projects   else
     redirect_to root_path, notice: "Action not allowed"
   end

 end


  private

  def set_user
   @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email,
     :password,:description,:sex, :birth_date, :password_confirmation,:photo,
     :categories)
  end


end
