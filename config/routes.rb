Rails.application.routes.draw do
  get '/me/:id' => 'users#me'
end
