class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = Like.new(
      user_id: current_user.id,
      boke_id: params[:boke_id]
    )
    @like.save
    redirect_to("/bokes/#{params[:boke_id]}")
  end


  def destroy
    @like = Like.find_by(
      user_id: current_user.id,
      boke_id: params[:boke_id]
    )
    @like.destroy
    redirect_to("/bokes/#{params[:boke_id]}")
  end

end
