class CategoriesController < ApplicationController

  def index
    @characters = current_user.characters
  end

  def create
    @characters = current_user.characters
    if @category = Category.create(category_params)
      redirect_to root_path
    else
      @characters = Character.includes(:past_topics)
      render template: characters/index
    end
  end

  def show
    @category = Category.find(params[:id])
    @characters = @category.characters
  end

  private
  
  def category_params
    params.require(:category).permit(:name, :describe).merge(user_id: current_user.id)
  end
end
