class BokesController < ApplicationController
  def create
    @boke = Boke.new(boke_params)

     respond_to do |format|
       if @boke.save
         format.html { redirect_to :action => "index",:controller => "odais" }
         format.json { render :show, status: :created, location: @boke }
       else
         format.html { redirect_to :action => "index",:controller => "odais" }
         format.json { render json: @boke.errors, status: :unprocessable_entity }
       end
     end
  end
  private


 #   # Never trust parameters from the scary internet, only allow the white list through.
    def boke_params
      params.require(:boke).permit(:content, :image)
    end
end
