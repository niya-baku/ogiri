class BokesController < ApplicationController
  # ユーザがログインしていない時にアクセスできない
  before_action :authenticate_user! , {only: [:new,:show,:create,:edit,:destroy]}

  def index
    @bokes = Boke.all.order(created_at: :desc) #投稿時に降順に表示される
    @odais = Odai.all.order(created_at: :desc) #投稿時に降順に表示される
    @odai = @odais.ids #お題idを全て取得する

    #@likes_count = Like.where(boke_id: @boke.id).count
  end

  def show
    @boke = Boke.find_by(id: params[:id])
    @odai = @boke.odai
    @user = @boke.user
    @likes_count = Like.where(boke_id: @boke.id).count
  end

  def create
    @boke = Boke.new(boke_params)

     respond_to do |format|
       if @boke.save
         format.html { redirect_to :action => "index" }
         format.json { render :show, status: :created, location: @boke }
       else
         format.html { redirect_to :action => "index" }
         format.json { render json: @boke.errors, status: :unprocessable_entity }
       end
     end
  end

  def edit
    @boke = Boke.find_by(id: params[:id])
  end

  def update
    @boke = Boke.find_by(id: params[:id])
    @boke.content = params[:content]
    if @boke.save
      flash[:notice] = "お題を編集しました！"
      redirect_to("/")
    else
    render("bokes/edit")
    end
  end

  def destroy
      @boke = Boke.find_by(id: params[:id])
      @boke.destroy
      flash[:notice] = "お題を削除しました。"
      redirect_to("/")
  end
  private


 #   # Never trust parameters from the scary internet, only allow the white list through.
    def boke_params
      params.require(:boke).permit(:content, :image, :odai_id).merge(user_id: current_user.id)
    end
end
