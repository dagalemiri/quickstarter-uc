class ProjectsController < ApplicationController
  include CheckCategories
  include Secured

  helper_method :valid_action, :is_checked_project?


  before_action :set_project, only: [:show, :destroy, :edit, :update, :new_comment, :edit_categories]
  before_action :logged_in?, only: [:destroy, :edit, :update, :create, :new]
  before_action only: [:destroy, :update, :edit] {valid_action(Project.find(params[:id])[:user_id])}


  def new
    @project = Project.new
  end

  def edit

    @owner = @project.user_id

    @categories = Category.all
    @project_cat = @project.categories
  end

  def edit_categories
    @project.categories.clear
    @project.categories << Category.where(name:params["categories"])
    redirect_to edit_project_path(@project.id)


  end

  def search
      @projects = Project.search(params[:search])
  end

  def show_categories
      @projects = Category.find_by(name:params[:name]).projects
      @name = params[:name]

  end


  def index
    #@projects = Projects.paginate(:per_page => 10, :page => params[:page])
    @projects = Project.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html
      format.js
    end


  end

  def destroy
    @project.destroy
    flash[:success] = "Project deleted"
    redirect_to projects_url
  end

  def show
    @currencies = ["AED","AFN","ALL","AMD","ANG","AOA","ARS","AUD","AWG","AZN","BAM","BBD","BDT","BGN","BHD","BIF","BMD","BND","BOB","BRL","BSD","BTC","BTN","BWP","BYN","BYR","BZD","CAD","CDF","CHF","CLF","CLP","CNY","COP","CRC","CUC","CUP","CVE","CZK","DJF","DKK","DOP","DZD", "EEK", "EGP", "ERN", "ETB", "EUR", "FJD", "FKP", "GBP", "GEL", "GGP", "GHS", "GIP", "GMD", "GNF", "GTQ", "GYD", "HKD", "HNL", "HRK", "HTG", "HUF", "IDR", "ILS", "IMP", "INR", "IQD", "IRR", "ISK", "JEP", "JMD", "JOD", "JPY", "KES", "KGS", "KHR", "KMF", "KPW", "KRW", "KWD", "KYD", "KZT", "LAK", "LBP", "LKR", "LRD", "LSL", "LTL", "LVL", "LYD", "MAD", "MDL", "MGA", "MKD", "MMK", "MNT", "MOP", "MRO", "MUR", "MVR", "MWK", "MXN", "MYR", "MZN", "NAD", "NGN", "NIO", "NOK", "NPR", "NZD", "OMR", "PAB", "PEN", "PGK", "PHP", "PKR", "PLN", "PYG", "QAR", "RON", "RSD", "RUB", "RWF", "SAR", "SBD", "SCR", "SDG", "SEK", "SGD", "SHP", "SLL", "SOS", "SRD", "STD", "SVC", "SYP", "SZL", "THB", "TJS", "TMT", "TND", "TOP", "TRY", "TTD", "TWD", "TZS", "UAH", "UGX", "USD", "UYU", "UZS", "VEF", "VND", "VUV", "WST", "XAF", "XAG", "XAU", "XCD", "XDR", "XOF", "XPF", "YER"]

    @comment = Comment.new
    @investment = Investment.new
    session[:project_id] = params[:id]
    @back_url = session[:my_previous_url]
  end

  def update
    respond_to do |format|
      @method = "update"
       if @project.update(project_params)
         format.html do
           redirect_to @project, notice: 'Project was successfully updated.'
         end
         format.json { render :show, status: :ok, location: @project }
       else
         format.html { render :edit }
         format.json { render json: @project.errors, status: :unprocessable_entity }
       end

     end

  end

  def create
    @project = Project.new(project_params)
    @project[:current] = 0
    respond_to do |format|
      if @project.save
        format.html do
          redirect_to '/projects/new', notice: 'Project was successfully created.'
        end
      else
        format.html { render :new, status: 422 }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def set_project
   @project = Project.find(params[:id])
  end

  def project_params

      if is_admin && @method == "update"
        params.require(:project).permit(:name, :goal,
     :description, :limit_date,:photo)
      else
        params.require(:project).permit(:name, :goal,
     :description, :limit_date,:photo).merge(user_id: current_user.id)
      end
  end

end
