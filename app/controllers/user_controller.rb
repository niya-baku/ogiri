class UserController < ApplicationController
  #ユーザがログインしている時にアクセスできない
  before_action :forbid_login_user, {only: [:new, :create]}

  # ユーザがログインしていない時にアクセスできない
  before_action :authenticate_user!	, {only: [:show,:edit,:update]}

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
   @user = User.new
  end

  def create
   @user = User.new(username: params[:username], email: params[:email])
   if @user.save
     flash[:notice] = "ユーザー登録が完了しました"
     redirect_to("/users/#{@user.id}")
   else
     render("users/new")
   end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
  end
end
