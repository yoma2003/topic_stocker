class CharactersController < ApplicationController
  before_action :authenticate_user!
  def index
    @characters = Character.includes(:user)
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

  def edit
    @character = Character.find(params[:id])
    end

  def update
    @character = Character.find(params[:id])
    if @character.update(character_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy
    redirect_to root_path
  end

  private

  def character_params
    params.require(:character).permit(:name, :image, :url, :describe).merge(user_id: current_user.id)
  end
end
