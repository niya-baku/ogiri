Rails.application.routes.draw do

  get '/' => "odais#index"
  get 'odais/new' => 'odais/new'
  get 'odais/:id' => 'odais#show'

  post "odais/new" => "odais#create"


  #投稿に対しての編集と削除
  get "odais/:id/edit" => "odais#edit"
  post "odais/:id/update" => "odais#update"
  post "odais/:id/destroy" => "odais#destroy"


  devise_for :users
   # get  'users/signup' => 'users#sign_up'
   # get 'users/sign_in' =>　'users#sign_in'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  #get 'posts/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
