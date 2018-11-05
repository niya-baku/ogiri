Rails.application.routes.draw do

  get '/' => "odais#index"
  get 'odais/new' => 'odais/new'
  get 'odais/:id' => 'odais#show'

  post "odais/create" => "odais#create"

  #投稿に対しての編集と削除
  get "odais/:id/edit" => "odais#edit"
  post "odais/:id/update" => "odais#update"
  post "odais/:id/destroy" => "odais#destroy"

  devise_for :users
  #get 'posts/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
