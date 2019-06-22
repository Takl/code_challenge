class UsersController < ApplicationController
  def me
    if params[:email].present?
      #@user = User.find(params[:id])
      @user = User.find_by(username: params[:email])
      # If the user exists AND the password entered is correct.
      require 'digest/md5'
      if @user && @user.pswd == Digest::MD5.hexdigest(params[:password])
      #if @user
        msg = 'Hello ' + @user.username
        render json: {message: msg}
      else
        # yr password is fail
        msg = 'Yr passwerd is Fail. Entry are Denied!' 
        render json: {message: msg}
      end    
    end  
  end
end