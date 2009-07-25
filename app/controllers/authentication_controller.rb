class AuthenticationController < ApplicationController
  def login
  end

  def check
    if params[:user] == "admin" && params[:password] == "password"
      reset_session
      session[:admin] = true
      flash[:notice] = "Login as 'admin' successful"
      redirect_to kinds_path
    elsif params[:user] == "dataentry" && params[:password] == "password"
      reset_session
      session[:dataentry] = true
      flash[:notice] = "Login as 'dataentry' successful"
      redirect_to trunks_path
    else
      reset_session
      flash[:error] = "Error while login"
      redirect_to :controller => "authentication", :action => "login"
    end
  end

  def logout
    reset_session
    flash[:notice] = "You are logged out"
    redirect_to :controller => "trunks", :action => "lookup_trunk"
  end

end