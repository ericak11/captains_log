class WelcomeController < ApplicationController
  def index
    if current_user
      user = User.find_by(id: session[:user_id])
      redirect_to :dashboard
    else
      redirect_to(login_path)
    end
  end
  def dashboard
    render 'users/dashboard'
  end
end
