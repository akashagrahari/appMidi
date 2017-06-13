class AccessController < ApplicationController


  def index
    if session[:user_id]
      redirect_to(:controller => 'home' , :action => 'learn')
    end
  end

  def login
    authorized_user = nil
    if params[:user][:email].present? && params[:user][:password].present?
      # find user
      found_user = User.email(params[:user][:email]).first
      # authorize user
      if found_user
        authorized_user = found_user.authenticate(params[:user][:password])
      end
    end

    if authorized_user
      session[:user_id] = authorized_user.id
      session[:first_name] = authorized_user.first_name
      flash[:success] = 'You are now logged in'
      redirect_to(:controller => 'home', :action => 'learn')
    else
      flash[:danger] = 'Invalid Login Credentials'
      render('index')
    end
  end

  def logout
    session[:user_id] = nil
    session[:first_name] = nil
    flash[:success] = 'You have been logged out'
    redirect_to(:controller => 'home', :action => 'learn')
  end

  def register
    if params[:user][:first_name].present? && params[:user][:last_name].present? && params[:user][:email].present? && params[:user][:password].present?
      # Check of existing user
      already_existing_user = User.email(params[:user][:email]).first
      if already_existing_user
        flash[:danger] = 'User already exists'
        render('index')
      end
      @user = User.new(user_params)
      # Try saving
      if @user.save
        session[:user_id] = @user.id
        session[:first_name] = @user.first_name
        flash[:success] = 'You are now logged in'
        redirect_to(:controller => 'home', :action => 'learn')
      else
        flash[:danger] = 'Something went wrong. Check data again'
        render('index')
      end
    else
      flash[:danger] = 'Bad Form Data. Please check again.'
      redirect_to(:action => 'index')
    end

  end

  private

  def user_params
    params.require(:user).permit(:first_name,:last_name,:email,:password)
  end

end
