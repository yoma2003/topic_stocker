class CategoriesController < ApplicationController
  before_action :authenticate
  before_action :set_categories

  def index
    # @characters = current_user.characters
    if params[:sort] == "updated_at"
      @characters = Character.order_updated_at(current_user.id).includes([:future_topics, :past_topics]).with_attached_image #updated_at順
    else
      @characters = Character.order_past_topic(current_user.id).includes([:future_topics, :past_topics]).with_attached_image #past_topic順（デフォルト）
    end
  end

  def new
    @characters = Character.where(user_id: current_user.id).order(name: :asc).with_attached_image
    @category = Category.new
  end

  def create
    # @characters = current_user.characters
    @category = Category.new(category_params)
    if @category.save
      redirect_to category_path(@category)
    else
      @characters = Character.where(user_id: current_user.id).order(name: :asc).with_attached_image
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
    # @characters = @category.characters
    if params[:sort] == "updated_at"
      @characters = Character.category_order_updated_at(@category.id).includes([:future_topics, :past_topics]).with_attached_image #updated_at順
    else
      @characters = Character.category_order_past_topic(@category.id).includes([:future_topics, :past_topics]).with_attached_image #past_topic順（デフォルト）
    end
  end

  def edit
    @category = Category.find(params[:id])
    @characters = Character.where(user_id: current_user.id).order(name: :asc).with_attached_image
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

  def authenticate
    redirect_to about_users_path unless user_signed_in?
  end

  def set_categories
    @categories = current_user.categories
  end
end
