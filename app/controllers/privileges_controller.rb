class PrivilegesController < ApplicationController
  def index
    @privileges = pri_tree
  end

  def edit
  end

  def new
    @pri = Privilege.new
  end

  def create
    @p = Privilege.new(privilege_params)
    # render plain: params.inspect

    @p.save
    redirect_to privileges_path
  end

  def destroy
    # render plain: params.inspect
    @pri = Privilege.find(params[:id])
    @pri.destroy

    redirect_to privileges_path
  end

  def destroy_multiple
        # render plain: params[:delid].to_s.inspect
      if params[:delid].blank?
          redirect_to :back, :alert => '请选择待删除项'
      else
          shops = Admin.find params[:delid]
          shops.each do |shop|
              shop.destroy
          end
          redirect_to admins_path
      end
  end


    private

        def privilege_params
            params.require(:privilege).permit(:pri_name, :controller_name,:action_name,:parent_id)
        end
end
