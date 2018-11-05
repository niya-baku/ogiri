class OdaisController < ApplicationController
  before_action :authenticate_user!	, only: :authentication

  def index
    @odais = Odai.all.order(created_at: :desc) #投稿時に降順に表示される
  end

  def authentication
  end

  def show
    @odai = Odai.find_by(id: params[:id])
  end

  def new
  end

  def create
    @odai = Odai.new(content: params[:content])
    @odai.save
    redirect_to("/")
  end

  def edit
    @odai = Odai.find_by(id: params[:id])
  end

  def update
    @odai = Odai.find_by(id: params[:id])
    @odai.content = params[:content]
    @odai.save
    redirect_to("/")
  end

  def destroy
      @odai = Odai.find_by(id: params[:id])
      @odai.destroy
      redirect_to("/")
  end
end
