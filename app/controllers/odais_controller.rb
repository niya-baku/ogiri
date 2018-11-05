class OdaisController < ApplicationController
  # ユーザがログインしていないと"show"にアクセスできない
  #before_action :authenticate_user!	, only: :show

  def index
    @odais = Odai.all.order(created_at: :desc) #投稿時に降順に表示される
  end

  def authentication
  end

  def show
    @odai = Odai.find_by(id: params[:id])
  end

  def new
    @odai = Odai.new
  end

  def create
    @odai = Odai.new(content: params[:content])
    if @odai.save
      flash[:notice] = "お題を投稿しました！！"
      redirect_to("/")
    else
      render("odais/new")
    end
  end

  def edit
    @odai = Odai.find_by(id: params[:id])
  end

  def update
    @odai = Odai.find_by(id: params[:id])
    @odai.content = params[:content]
    if @odai.save
      flash[:notice] = "お題を編集しました！"
      redirect_to("/")
    else
    render("odais/edit")
    end
  end

  def destroy
      @odai = Odai.find_by(id: params[:id])
      @odai.destroy
      flash[:notice] = "お題を削除しました。"
      redirect_to("/")
  end
end
