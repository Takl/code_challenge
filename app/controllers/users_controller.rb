class UsersController < ApplicationController
  def me
    render json: { message: 'Hello (user_name)'}
  end
end