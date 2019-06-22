class UsersController < ApplicationController
  def me
    @user = User.find(params[:id])
    msg = 'Hello ' + @user.username
    render json: { message: msg}
  end
end