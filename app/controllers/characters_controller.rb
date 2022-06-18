class CharactersController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def new
    @character = Character.new
  end

  def create
    if Character.create(character_params)
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def character_params
    params.require(:character).permit(:name, :url, :describe).merge(user_id: current_user.id)
  end
end
