module Api::V1
  class InvestmentsController < ApiController

    include Secured

    before_action :authenticate

    def create
      project = Project.find(params[:project_id])
      if project.goal < project.current + params[:amount].to_i
        owner = project.user_id
        ExampleMailer.goal_reach_investor(owner,project).deliver_later
        project.investments.pluck(:user_id).uniq.each do |user_id|
          investor = User.find(user_id)
          ExampleMailer.goal_reach_investor(investor,project).deliver_later
        end
      end
      @investment = Investment.new(project_id:params[:project_id].to_i,user_id:@current_user.id,amount:params[:amount].to_i)
      if @investment.save
        project = Project.find(@investment.project_id)
        owner = User.find(project.user_id)
        investor = User.find(@investment.user_id)
        ExampleMailer.donation_email_owner(owner,project, @investment).deliver_later
        ExampleMailer.donation_email_investor(investor,project, @investment).deliver_later
      else 
        render json: { errors: @investment.errors }, status: :unprocessable_entity	
      end
    end

    private

    def set_investment
        @investment = Investment.find(params[:id])
    end

    def investment_params
        params.require(:investment).permit(:amount,:project_id)
    end

  end
end
