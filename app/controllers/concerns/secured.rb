# Module for securing controllers access
module Secured
  extend ActiveSupport::Concern

  ##
  # Verify if current_user is logged_in
  def logged_in?
    redirect_to(root_path, notice: 'Unauthorized access!') unless current_user
  end

  def valid_action(id)
    redirect_back(fallback_location: root_path, notice: 'Unauthorized access!!!!') unless ((current_user.try(:id) == id) || is_admin)
  end

  def valid_comment_action(id)
    comment = Comment.find(id)
    user_current = current_user.try(:id)
    redirect_back(fallback_location: root_path, notice: 'Unauthorized access!') unless (user_current == Project.find(comment.project_id).user_id || is_admin || comment.user_id == user_current)
    true
  end

  def valid_comment_token_action(id)
    comment = Comment.find(id)
    user_current = @current_user.try(:id)
    p user_current 
    p comment.user_id
    p Project.find(comment.project_id).user_id 
    p (user_current == Project.find(comment.project_id).user_id || comment.user_id == user_current)
    if (user_current == Project.find(comment.project_id).user_id || comment.user_id == user_current)
      return true
    else
      render json: {
              comment: {
                id: comment.id,
                state: "Could not be deleted"
              }
      }
    end 
  end

  def valid_action_token(id)
    if  (@current_user.try(:id) == id)
      return true
    else
      render json: {
        project:{
          state: 'Could not be deleted.',
          id: id
        }
      }
    end

  end


end
