class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response



  def show
    item = User.find(params[:id])
    render json: item, include: :items
  end

  private

  def render_not_found_response
    render json: { error: "User not found" }, status: :not_found
  end
  
end
