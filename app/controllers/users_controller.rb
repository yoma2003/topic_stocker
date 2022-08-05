class UsersController < ApplicationController
  before_action :ensure_normal_user, only: [:edit, :update]

  def edit
  end

  def update
    if current_user.update(image_resize(user_params))
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :image)
  end

  def image_resize(params)
    if params[:image]
      params[:image].tempfile = ImageProcessing::MiniMagick.source(params[:image].tempfile).resize_to_limit(500, 500).call
    end
    params
  end

  def ensure_normal_user
    if current_user.email == 'guest@example.com'
      redirect_to root_path, flash: { guest_user_error: 'ゲストユーザーの情報編集はできません。' }
    end
  end
end
