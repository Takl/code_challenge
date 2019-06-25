Rails.application.routes.draw do
#  get '/me/:id' => 'users#me'
  get '/me' => 'users#me'
  post '/me' => 'users#me'
end
