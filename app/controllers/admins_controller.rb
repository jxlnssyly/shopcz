class AdminsController < ApplicationController

    before_action :signed_in_user, only: [:index,:edit,:update,:show,:destroy,:destroy_multiple]

    def index
        @admin = Admin.find_by(username: params[:un])
        if @admin
            @admins = Admin.where(username: params[:un]).paginate(page: params[:page])
        else
            @admins = Admin.paginate(page: params[:page])
        end
    end

    def new
        @admin = Admin.new()
    end

    def create
        @admin = Admin.new(admin_params)
        if @admin.save
            redirect_to admins_path
        else
            render 'new'
        end
    end

    def edit
        @admin = Admin.find(params[:id])
    end

    def update
        @admin = Admin.find(params[:id])
        if @admin.update_attributes(admin_params)
            redirect_to admins_path
        else
            render 'edit'
        end
    end

    def destroy
        @admin = Admin.find(params[:id])
        @admin.destroy

        redirect_to admins_path
    end

    def show
    end

    def destroy_multiple
        # render plain: params[:delid].to_s.inspect
      if params[:user_ids].blank?
          redirect_to :back, :alert => '请选择待删除项'
      else
          shops = Admin.find params[:user_ids]
          shops.each do |shop|
              shop.destroy
          end
          redirect_to admins_path
      end
end



    private

        def admin_params
            params.require(:admin).permit(:username, :password)
        end



end
