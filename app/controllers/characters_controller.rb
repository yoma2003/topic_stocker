class CharactersController < ApplicationController
  before_action :set_categories

  def new
    @character_topic = CharacterTopic.new
  end

  def create
    @character_topic = CharacterTopic.new(image_resize(character_topic_params))
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
    if @character.update(image_resize(character_params))
      redirect_to root_path
    else
      @latest_future_topic = @character.future_topics[0]
      @past_topics = @character.past_topics.order(created_date: :DESC).order(id: :DESC)
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
    params.require(:character).permit(:name, :image, :twitter_id, :facebook_id, :instagram_id, :describe, category_ids: []).merge(user_id: current_user.id)
  end

  def character_topic_params
    params.require(:character_topic).permit(:name, :image, :twitter_id, :facebook_id, :instagram_id, :describe, :past_topic, :created_date, :future_topic, category_ids: []).merge(user_id: current_user.id)
  end

  def set_categories
    @categories = current_user.categories
  end

  def image_resize(params)
    if params[:image]
      params[:image].tempfile = ImageProcessing::MiniMagick.source(params[:image].tempfile).resize_to_limit(500, 500).call
    end
    params
  end
end
