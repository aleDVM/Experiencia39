class PagesController < ApplicationController
	load_and_authorize_resource
  def dashboard
  	@users = User.all
  end
  def update
  	@user = User.find(params[:id])
  	@user.update(role: admin)
  	redirect_to pages_dashboard_path
  end
  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	redirect_to pages_dashboard_path
  end
end
