class BokesController < ApplicationController

  def index
    @bokes = Boke.all.order(created_at: :desc) #投稿時に降順に表示される
    @odais = Odai.all.order(created_at: :desc)
  end

  def show
    @boke = Boke.find_by(id: params[:id])
    @odai = @boke.odai
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

  def destroy
      @boke = Boke.find_by(id: params[:id])
      @boke.destroy
      flash[:notice] = "お題を削除しました。"
      redirect_to("/bokes/index")
  end
  private


 #   # Never trust parameters from the scary internet, only allow the white list through.
    def boke_params
      params.require(:boke).permit(:content, :image).merge(user_id: current_user.id)
    end
end
