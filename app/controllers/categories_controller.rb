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

  def edit
    @category = Category.find(params[:id])
    @characters = current_user.characters
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to category_path(@category)
    else
      render :edit
    end
  end

  private
  
  def category_params
    params.require(:category).permit(:name, :describe, character_ids: []).merge(user_id: current_user.id)
  end
end
