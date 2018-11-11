Rails.application.routes.draw do
  #いいね機能
  post "likes/:boke_id/create" => "likes#create"
  #いいね機能(削除)
  post "likes/:boke_id/destroy" => "likes#destroy"

  #お題に対しての回答
  get "/" => "bokes#index"
  get "bokes/:id" => "bokes#show"
  get "bokes/:id/edit" => "bokes#edit"
  post "bokes/:id/update" => "bokes#update"
  post "bokes/:id/destroy" => "bokes#destroy"

  #投稿に対しての編集と削除
  get 'odais/index' => "odais#index"
  get 'odais/new' => 'odais/new'
  get 'odais/:id' => 'odais#show'
  post "odais/new" => "odais#create"

  get "odais/:id/edit" => "odais#edit"
  post "odais/:id/update" => "odais#update"
  post "odais/:id/destroy" => "odais#destroy"
  post "odais/:id/bokes/create" => "bokes#create"

  get 'users' => 'user#index' #ユーザー一覧
  get "users/:id/edit" => "user#edit"
  post "users/create" => "user#create"
  get "users/:id/likes" => "user#likes"


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
