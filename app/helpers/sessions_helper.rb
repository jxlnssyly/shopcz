module SessionsHelper

	def sign_in(user)
		remember_token = Admin.new_remember_token
		cookies.permanent[:remember_token] = remember_token
		user.update_attribute(:remember_token, Admin.encrypt(remember_token))
		self.current_admin = user
	end

	def current_admin=(user)
		@current_admin = user
	end

	def current_admin
		remember_token = Admin.encrypt(cookies[:remember_token])
    	@current_admin ||= Admin.find_by(remember_token: remember_token)
    end

    def current_admin?(user)
    	user == current_admin?
    	
    end

    def signed_in_user
        unless signed_in?
            store_location
            redirect_to signin_url,notice: "请登录."
        end
    end

    def signed_in?
        !current_admin.nil?
    end

    def redirect_back_or(default)
	    redirect_to(session[:return_to] || default)
	    session.delete(:return_to)
	end

    def store_location
        session[:return_to] = request.fullpath
    end

    def sign_out
        self.current_admin = nil
        cookies.delete(:remember_token)
    end
end
