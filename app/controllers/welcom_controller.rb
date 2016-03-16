class WelcomController < ApplicationController
  def index
    @banner = Banner.find(1)
    @services = Service.all.order("created_at DESC")
    @houses = House.all.limit(6).order("created_at DESC")
    @map = Map.find(1)
  end

end
