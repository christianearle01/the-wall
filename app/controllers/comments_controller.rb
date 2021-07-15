class CommentsController < ApplicationController
    def comment
        @user = User.find(session[:id])
        @message = Message.find(params[:comment][:message_id])
        @comment = Comment.new(comment_params)
        @comment.message = @message
        @comment.user = @user
        @error = ""
        if @comment.save
          # render plain: 'User was successfully created.'
          redirect_to "/messages"
        else
            (@comment.errors.full_messages).each do |error|
              @error += "<h5> #{error} </h5>"
            end
            redirect_to "/messages", alert: @error
        end
    end
    private
    def comment_params
        params.require(:comment).permit(:comment, :message, :user)
    end
end
