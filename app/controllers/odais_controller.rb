class OdaisController < ApplicationController
  before_action :authenticate_user!	, only: :authentication

  def index
    @odais = Odai.all.order(created_at: :desc) #投稿時に降順に表示される
  end

  def authentication
  end
end
