class CharactersController < ApplicationController
  before_action :authenticate_user!
  def new
    @character_topic = CharacterTopic.new
  end

  def create
    @character_topic = CharacterTopic.new(character_topic_params)
    if @character_topic.valid?
      @character_topic.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @character = Character.find(params[:id])
    @latest_future_topic = @character.future_topics[0]
    @past_topics = @character.past_topics.order(created_date: :DESC).order(id: :DESC)
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

  def character_topic_params
    params.require(:character_topic).permit(:name, :image, :url, :describe, :past_topic, :created_date, :future_topic, category_ids: []).merge(user_id: current_user.id)
  end
end
