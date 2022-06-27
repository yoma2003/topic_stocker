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
  end

  private
  
  def past_topic_params
    params.require(:past_topic).permit(:past_topic, :created_date, :character_id)
  end
end
