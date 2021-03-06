class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
     redirect_to blogs_path
      else
        flash.now[:danger] = 'adresse e-mail ou mot de passe incorrect'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'Déconnecté'
    redirect_to new_session_path
  end
end
