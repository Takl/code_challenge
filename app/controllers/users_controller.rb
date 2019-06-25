class UsersController < ApplicationController
  def me
    if params[:email].present?
      @user = User.find_by(username: params[:email])
      # If the user exists AND the password entered is correct.
      require 'digest/md5'
      if @user && @user.pswd == Digest::MD5.hexdigest(params[:password])
        msg = 'Hello ' + @user.username
        render json: {message: msg}
      else
        # your password is fail
        msg = 'Yr passwerd is Fail. Entry are Denied!' 
        render :status => "401", :json => {:message => msg}.to_json
      end    
    end  
  end
end