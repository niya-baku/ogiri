Rails.application.routes.draw do

  get '/' => "odais#index"
  get 'odais/new' => 'odais/new'
  get 'odais/:id' => 'odais#show'

  post "odais/create" => "odais#create"

  devise_for :users
  #get 'posts/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
