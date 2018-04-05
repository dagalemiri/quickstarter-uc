module Api::V1
  class CommentsController < ApiController

    include Secured

    before_action :authenticate
    before_action :set_comment, only: [:show, :destroy]
    before_action only:[:destroy] {valid_comment_token_action(params[:id])}


    def show; end

    def create
        @comment = Comment.new(content:params[:content],project_id:params[:project_id],user_id:@current_user.id)
        return if @comment.save
        render json: { errors: @comment.errors }, status: :unprocessable_entity		      
    end

    def destroy
        p @comment.destroy
        #render json: { errors: @comment.errors }, status: :unprocessable_entity	
    end

    private

    def set_comment
        @comment = Comment.find(params[:id])
    end

    def comment_params
        params.require(:comment).permit(:content,:project_id)
    end

  end
end
