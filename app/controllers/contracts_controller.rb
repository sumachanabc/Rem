class ContractsController < ApplicationController

  def index
    @contracts = @condo.contracts
  end

  def select_condo
    @condos = Condo.all
  end

  def new
    @contract = Contract.new
    @condo_id = params[:condo_id]
    @condo_users_for_select = condo_users_for_select(@condo_id)
    @parkings_for_select = parkings_for_select(@condo_id)
  end

  def create
    @contract = Contract.new(contract_params)
    @contract.user = current_user
  
    condo_id = @contract.condo_id
    @condo_users_for_select = condo_users_for_select(condo_id)
    @parkings_for_select = parkings_for_select(condo_id)
  
    if @contract.save
      redirect_to root_path, notice: '区画契約情報が正常に登録されました。'
    else
      Rails.logger.debug @contract.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def contract_params
    params.require(:contract).permit(:condo_id, :condo_user_id, :vehicle_type_id, :vehicle_model_code, :vehicle_number, :start_date, :end_date, :parking_id)
  end
  

  def condo_users_for_select(condo_id)
    CondoUser.where(condo_id: condo_id).map do |user|
      label = "#{user.room_number}号室 #{user.condo_user_last_name} #{user.condo_user_first_name}"
      [label, user.id]
    end
  end
  
  def parkings_for_select(condo_id)
    Parking.where(condo_id: condo_id).map do |parking|
      vehicle_type_name = VehicleType.find(parking.vehicle_type_id).name
      label = "#{vehicle_type_name}: #{parking.parking_number}"
      [label, parking.id]
    end
  end
  
end
