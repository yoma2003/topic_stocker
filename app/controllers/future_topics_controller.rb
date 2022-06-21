class FutureTopicsController < ApplicationController
  def update
    future_topic = FutureTopic.find(params[:id])
    future_topic.update(future_topic_params)
    redirect_to root_path
  end

  private
  
  def future_topic_params
    params.require(:future_topic).permit(:future_topic, :character_id)
  end
end
