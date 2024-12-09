class Api::V1::UsersController < ApplicationController
  # before_action :authenticate_user!

  def email_format
    format = EmailFormat.find_by(name: params[:name])
    if format
      content = format.content.gsub("{{user_name}}", current_user.user_name)
      render json: { content: content }, status: :ok
    else
      render json: { error: "Format not found" }, status: :not_found
    end
  end


  def send_notification
    # byebug
    email_data = {
      to: params[:email], 
      subject: "Custom Subject"
    }

    NotificationMailer.send_email(params[:name], email_data).deliver_now

    render json: { message: "Email sent!" }
  end
end
