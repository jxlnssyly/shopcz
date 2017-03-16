class SessionsController < ApplicationController

  def new
  end

  def create
  	user = Admin.find_by(username: params[:session][:username])
  	# render plain: (verify_rucaptcha?(params[:_rucaptcha])).inspect
  	if user && user.authenticate(params[:session][:password]) && verify_rucaptcha?(params[:rucaptcha_input])
  		sign_in user
  		redirect_to root_path
  	else
  		flash[:error] = 'Invalid email/password combination' # Not quite right!
  		render 'new'
  	end
  end


  def destroy
    # render plain: "test".inspect
  	sign_out
  	redirect_to admins_path
  end
end
