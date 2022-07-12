class CategoriesController < ApplicationController
  before_action :set_categories

  def index
    # @characters = current_user.characters
    
    if params[:sort] == "updated_at"
      @characters = Character.order_updated_at(current_user.id) #updated_at順
    else
      @characters = Character.order_past_topic(current_user.id) #past_topic順（デフォルト）
    end
  end

  def new
    @characters = Character.where(user_id: current_user.id).order(name: :asc)
    @category = Category.new
  end

  def create
    @characters = current_user.characters
    if @category = Category.create(category_params)
      redirect_to category_path(@category)
    else
      @characters = Character.includes(:past_topics)
      render template: characters/index
    end
  end

  def show
    @category = Category.find(params[:id])
    # @characters = @category.characters

    if params[:sort] == "updated_at"
      @characters = Character.category_order_updated_at(@category.id) #updated_at順
    else
      @characters = Character.category_order_past_topic(@category.id) #past_topic順（デフォルト）
    end
  end

  def edit
    @category = Category.find(params[:id])
    @characters = Character.where(user_id: current_user.id).order(name: :asc)
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to category_path(@category)
    else
      render :edit
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to root_path
  end

  private
  
  def category_params
    params.require(:category).permit(:name, :describe, character_ids: []).merge(user_id: current_user.id)
  end

  def set_categories
    @categories = current_user.categories
  end
end
