class LoginController < ApplicationController


  def login
    @admin = Admin.new
  end

  def sigin
    @admin = Admin.new(login_params)
    if verify_rucaptcha?(params[:_rucaptcha]) && (@admin.login == true)
        cookies.permanent[:id] = @admin.id
        cookies.permanent[:username] = @admin.username
        redirect_to admins_path, notice: '登录成功'
    else
        flash[:error] = "登录失败"
        render 'login'
    end
  end

  def logout
    sign_out
    redirect_to login_path
  end

      private
        def login_params
            params.require(:admin).permit(:username, :password)
        end
end
