module AdminsHelper

    def signed_in_user
        # render plain: cookies[:id].inspect
        unless signed_in?.blank?
            store_location
            redirect_to login_url,notice: "请登录."
        end
    end

    def signed_in?
        @signed = cookies[:id].blank? || cookies[:username].blank?
    end

    def store_location
        session[:return_to] = request.fullpath
    end

    def sign_out
        cookies[:id] = nil
        cookies[:username] = nil
    end

end
