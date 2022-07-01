class PastTopicsController < ApplicationController
  def update
    latest_past_topic = PastTopic.find(params[:id])
    latest_past_topic.update(past_topic_params)
  end

  def create
    new_past_topic = PastTopic.create(past_topic_params)
    render json: { new_past_topic: new_past_topic }
  end

  def destroy
    delete_past_topic = PastTopic.find(params[:id])
    delete_past_topic.destroy

    if params[:character_id] #indexpage-delete-topic.jsから来たリクエストの処理
      character = Character.find(character_id_params)
      latest_past_topic = character.past_topics.order(created_date: :DESC).order(id: :DESC)[0]
      render json: { latest_past_topic: latest_past_topic }
    end
  end

  private

  def past_topic_params
    params.require(:past_topic).permit(:past_topic, :created_date, :character_id)
  end

  def character_id_params
    params.require(:character_id)
  end
end
