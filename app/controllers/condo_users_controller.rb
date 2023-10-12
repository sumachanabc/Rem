class CondoUsersController < ApplicationController

  def index
    @condo = Condo.find(params[:condo_id])
    @condo_users = @condo.condo_users
    authorize @condo
  end

end
