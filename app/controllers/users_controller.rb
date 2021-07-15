class UsersController < ApplicationController
  def new
    if session[:id]
      redirect_to "/messages"
    end
  end

  def login
    @user = User.find_by(username: params[:user][:username])
    unless @user
      create params[:user][:username]
    else
      session[:id] = @user.id
      redirect_to "/messages"
    end
  end

  def create username
    @user = User.new(username: username)
    
    if @user.save
        # render plain: 'User was successfully created.'
        session[:id] = @user.id
        redirect_to "/messages"
    else
        @error = ""
        (@user.errors.full_messages).each do |error|
        @error += "<h5> #{error} </h5>"
        end
        redirect_to "/users/new", alert: @error
    end
  end

  def logout
    session[:id] = nil
    redirect_to "/users/new"
  end
end
