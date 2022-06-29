class CategoriesController < ApplicationController
  def create
    if @category = Category.create(category_params)
      redirect_to root_path
    else
      @characters = Character.includes(:past_topics)
      render template: characters/index
    end
  end

  private
  
  def category_params
    params.require(:category).permit(:name, :describe)
  end
end
