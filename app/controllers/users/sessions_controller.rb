class Users::SessionsController < Devise::SessionsController #Deviseコントローラーを継承
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, alert: "ゲストユーザーでログインしています。データは定期的に初期化されます。"
  end
end