class HousesController < ApplicationController
  before_action :find_house, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @houses = House.all.order("created_at DESC").paginate(page: params[:page], per_page: 12)
  end

  def new
    @house = House.new
    @house.images.build
  end

  def create
    @house = House.new params_house

    if @house.save
      redirect_to @house, notice: t("houses.create.successNotice")
    else
      render 'new', notice: t("houses.create.failedNotice")
    end
  end

  def show
  end

  def edit
    @house.images.build
  end

  def update
    if @house.update params_house
      redirect_to @house, notice: t("houses.update.successNotice")
    else
      render 'edit', notice: t("houses.update.failedNotice")
    end
  end

  def destroy
    if @house.destroy
      redirect_to houses_path, notice: t("houses.delete.successNotice")
    end
  end

  private

  def find_house
    @house = House.find(params[:id])
  end

  def params_house
    params.require(:house).permit(:title, :price, :description, :poster, images_attributes: [:id, :image, :_destroy])
  end

end
