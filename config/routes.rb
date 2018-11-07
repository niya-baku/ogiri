Rails.application.routes.draw do

  get '/' => "odais#index"
  get 'odais/new' => 'odais/new'
  get 'odais/:id' => 'odais#show'
  post "odais/new" => "odais#create"

  get 'users' => 'user#index' #ユーザー一覧
  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"

  #投稿に対しての編集と削除
  get "odais/:id/edit" => "odais#edit"
  post "odais/:id/update" => "odais#update"
  post "odais/:id/destroy" => "odais#destroy"
  post "odais/:id/bokes/create" => "bokes#create"

  devise_for :users, path_names: { sign_in: "login", sign_out: "logout"}
   # get  'users/signup' => 'users#sign_up'
   # get 'users/sign_in' =>　'users#sign_in'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get 'users/:id' => 'user#show'
  #get 'posts/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
