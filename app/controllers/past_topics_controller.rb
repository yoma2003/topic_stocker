class PastTopicsController < ApplicationController
  def update
    latest_past_topic = PastTopic.find(params[:id])
    latest_past_topic.update(past_topic_params)
  end

  private
  
  def past_topic_params
    params.require(:past_topic).permit(:past_topic, :created_date, :character_id)
  end
end
