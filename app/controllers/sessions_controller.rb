class SessionsController < ApplicationController

  def new
  end

  def create
	user = User.authenticate(params[:session][:email], params[:session][:password])
	
	if user
		flash[:notice] = "Welcome, #{user.email}!" 
		redirect_to user
	else
		flash[:error] = 'Invalid email/password combination'
		redirect_to new_sessions_path	
	end
  end

  def destroy
  end

end