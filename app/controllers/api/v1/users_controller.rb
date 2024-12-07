class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!

  def email_format
    format = EmailFormat.find_by(name: params[:name])
    if format
      content = format.content.gsub("{{user_name}}", current_user.user_name)
      render json: { content: content }, status: :ok
    else
      render json: { error: "Format not found" }, status: :not_found
    end
  end
end
