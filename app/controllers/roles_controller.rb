class RolesController < ApplicationController
  def index
    @roles = Role.all
  end

  def edit
    @role = Role.find(params[:id])
  end

  def new
    @role = Role.new
  end

  def update
    # render plain: params.inspect
    @role = Role.find(params[:id])
    @role.pri_id_list = params[:pri_id_list].to_s
    @role.save
    redirect_to roles_path
  end

  def create
    @role = Role.new(role_params)
    # render plain: @role.inspect
    @role.pri_id_list = params[:pri_id_list].to_s
    if @role.save
      redirect_to roles_path
    else
      render 'new'
    end

  end

  def destroy
  end

    def destroy_multiple
      if params[:delid].blank?
          redirect_to :back, :alert => '请选择待删除项'
      else
          shops = Role.find params[:delid]
          shops.each do |shop|
              shop.destroy
          end
          redirect_to roles_path
      end
  end

  private

    def role_params
      params.require(:role).permit(:role_name)
    end
end
