class FutureTopicsController < ApplicationController
  def update
    latest_future_topic = FutureTopic.find(params[:id])
    latest_future_topic.update(future_topic_params)
    if latest_future_topic.saved_changes?
      latest_future_topic.character.touch
    end
  end

  private
  
  def future_topic_params
    params.require(:future_topic).permit(:future_topic, :character_id)
  end
end
