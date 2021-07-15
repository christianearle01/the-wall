class MessagesController < ApplicationController
  def index
    @user = User.find(session[:id])
    @message = Message.joins(:user).select("*")
    @comments = Comment.joins(:user).select("*")
  end
  def message
    @user = User.find(session[:id])
    @message = Message.new(message_params)
    @message.user = @user
    @error = ""
    if @message.save
      # render plain: 'User was successfully created.'
      redirect_to "/messages"
    else
        (@message.errors.full_messages).each do |error|
          @error += "<h5> #{error} </h5>"
        end
        redirect_to "/messages", alert: @error
    end
  end
  private
  def message_params
    params.require(:message).permit(:message, :user)
  end
end
