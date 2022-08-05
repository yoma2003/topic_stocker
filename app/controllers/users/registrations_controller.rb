class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: :destroy

  def ensure_normal_user
    if resource.email == 'guest@example.com'
      redirect_to root_path, flash: { guest_user_error: 'ゲストユーザーの削除はできません。'}
    end
  end
end