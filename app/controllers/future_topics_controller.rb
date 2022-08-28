class FutureTopicsController < ApplicationController
  before_action :authenticate

  def update
    latest_future_topic = FutureTopic.find(params[:id])
    latest_future_topic.update(future_topic_params)
    if latest_future_topic.saved_changes?
      latest_future_topic.character.touch
    end
  end

  private

  def authenticate
    redirect_to about_users_path unless user_signed_in?
  end
  
  def future_topic_params
    params.require(:future_topic).permit(:future_topic, :character_id)
  end
end
