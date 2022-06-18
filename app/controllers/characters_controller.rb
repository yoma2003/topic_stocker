class CharactersController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    if @character.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def character_params
    params.require(:character).permit(:name, :image, :url, :describe).merge(user_id: current_user.id)
  end
end
