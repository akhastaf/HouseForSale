class DashboardController < ApplicationController
  before_action :authenticate_user!

  def services
    @services = Service.all.order("id DESC")
  end

  def change_banner
    @banner = Banner.find(1)
  end

  def update_banner
    @banner = Banner.find(1)
    if @banner.update params_banner
      redirect_to services_path, notice: t("dashboard.updateBanner.successNotice")
    else
      render "change_banner", notice: t("dashboard.updateBanner.failedNotice")
    end
  end

  def change_service
    @service = Service.find(params[:id])
  end

  def update_service
    @service = Service.find(params[:id])
    if @service.update params_service
      redirect_to services_path, notice: t("dashboard.updateService.successNotice")
    else
      render "change_service", notice: t("dashboard.updateService.failedNotice")
    end
  end

  def edit_map
    @map = Map.find(1)
  end

  def update_map
    @map = Map.find(1)
    if @map.update params_map
      redirect_to services_path, notice: t("dashboard.updateMap.successNotice")
    else
      render "edit_map", notice: t("dashboard.updateMap.failedNotice")
    end
  end


  private

  def params_banner
    params.require(:banner).permit(:title, :banner)
  end

  def params_service
    params.require(:service).permit(:title, :description, :service)
  end

  def params_map
    params.require(:map).permit(:lat, :lng)
  end

end
