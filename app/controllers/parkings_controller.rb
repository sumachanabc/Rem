class ParkingsController < ApplicationController
  before_action :set_condo, only: [:index]

  def index
    @parkings = @condo.parkings
  end

  def new
    @parking = Parking.new
    @condos_for_select = condos_for_select
    @selected_condo_id = Condo.first.id
    render 'new'
  end

  def create
    if current_user.admin? || current_user.manage?
      @parking = Parking.new(parking_params)
      @condos_for_select = condos_for_select

      if @parking.save
        redirect_to root_path, notice: '区画情報が正常に登録されました。'
      else
        render :new
      end
    end
  end

  private

  def set_condo
    @condo = Condo.find(params[:condo_id])
  end

  def parking_params
    params.require(:parking).permit(:parking_number, :vehicle_type_id, :parking_type_id, :roof, :special_category_id, :condo_id)
  end

  def condos_for_select
    Condo.all.map { |condo| [condo.condo_name, condo.id] }
  end
end

