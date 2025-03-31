class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    handle_auth("Google")
  end

  def facebook
    user = User.find_for_facebook_oauth(request.env['omniauth.auth'])

    if user.persisted?
      sign_in_and_redirect user, event: :authentication
      set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  def instagram
    handle_auth("Instagram")
  end

  private

  def handle_auth(kind)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      flash[:notice] = "Connexion réussie via #{kind} !"
    else
      flash[:alert] = "Erreur lors de l'authentification avec #{kind}."
      redirect_to new_user_registration_url
    end
  end
end

