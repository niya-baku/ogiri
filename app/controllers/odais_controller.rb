class OdaisController < ApplicationController
  # ユーザがログインしていない時にアクセスできない
  before_action :authenticate_user	, {only: [:index,:show,:new,:create,:edit,:update,:destroy]}



  def index
    @odais = Odai.all.order(created_at: :desc) #投稿時に降順に表示される
  end

  def authentication
  end

  def show
    @odai = Odai.find_by(id: params[:id])
    @boke = Boke.new
    @user = @odai.user
  end

  def new
    @odai = Odai.new
  end

  def create
    @odai = Odai.new(odai_params)
    #@odai = Odai.new(content: params[:content])
     respond_to do |format|
       if @odai.save
         format.html { redirect_to :action => "index" }
         format.json { render :show, status: :created, location: @odai }
       else
         format.html { render :new }
         format.json { render json: @odai.errors, status: :unprocessable_entity }
       end
     end

    # if @odai.save
    #   flash[:notice] = "お題を投稿しました！！"
    #   redirect_to("/")
    # else
    #   render("odais/new")
    # end
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

   private
     # Use callbacks to share common setup or constraints between actions.
     def set_odai
       @odai = Odai.find(params[:id])
     end

  #   # Never trust parameters from the scary internet, only allow the white list through.
     def odai_params
       params.require(:odai).permit(:content, :image).merge(user_id: current_user.id)
     end
end
