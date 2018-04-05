class CommentsController < ApplicationController
  include Secured
  before_action :logged_in?, only: %i[edit update destroy]
  before_action :set_comment, only: [:show, :destroy, :edit, :update]
  before_action only:[:destroy, :edit, :update] {valid_comment_action(params[:id])}


  def index
    if is_admin
      @comments = Comment.all
    else
      redirect_to root_path, notice: "Action not allowed"
    end
  end

  def edit
    @project_id = session[:project_id]
  end


  def destroy
    comment_id = @comment.id
    @comment.destroy
    flash[:success] = "Comment deleted"
    # redirect_back(fallback_location: root_path)
    #redirect_to project_path(session[:project_id])
    #redirect_to :back

    respond_to do |format|
       format.html { redirect_back(fallback_location: root_path) }
       format.json do
         render json: {
             comment_id: comment_id
           }
       end
     end
  end

  def create
    if current_user
      @comment = Comment.new(comment_params)

      respond_to do |format|
       if @comment.save
         format.html do
          redirect_to project_path(@comment.project_id), notice: 'Comment was successfully created.'
        end
        format.js
      else
         format.html { render :new, status: 422 }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
     end
   end
  else

  end

  end


  def update
    respond_to do |format|
       if @comment.update(comment_params)
         format.html do
           redirect_to project_path(session[:project_id]), notice: 'Comment was successfully created.'
         end
         format.json { render :show, status: :ok, location: @comment }
       else
         format.html { render :edit }
         format.json { render json: @comment.errors, status: :unprocessable_entity }
       end

     end

  end
  private

  def set_comment
   @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, project_id:session[:project_id])
  end


end
