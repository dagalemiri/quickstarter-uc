module Api::V1
  class ProjectsController < ApiController
    include Secured

    before_action :authenticate
    before_action :set_project, only: [:show, :destroy, :comments]
    before_action only: [:destroy] {valid_action_token(Project.find(params[:id])[:user_id])}

    def new; end

    def index
      @projects = Project.all
    end

    def show; end

    def create
      @project = Project.new(name:params[:name], goal:params[:goal].to_i , user_id: @current_user.id)
      @project[:current] = 0
      return if @project.save
        render json: { errors: @project.errors }, status: :unprocessable_entity
    end

    def destroy
        return if @project.destroy
          render json: { errors: @project.errors }, status: :unprocessable_entity
    end

    def comments
      @comments = @project.comments
    end

    private
    
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
        params.require(:project).permit(:name, :goal,:description, :limit_date,:photo).merge(user_id: @current_user.id)
    end

  end
end
