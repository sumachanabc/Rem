ActiveAdmin.register Condo do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :condo_name, :postal_code, :condo_address, 
                :floor, :basement_floor, :total_number_of_unit, 
                :completion_year, :structure_id, :site_area, 
                :total_floor_area, :parking_space, :bicycle_parking_space, 
                :maintenance_fee, :repair_reserve_fund, 
                :management_company_name, :management_company_postal_code, 
                :management_company_address, :management_company_phone_number, 
                :management_type_id, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:condo_name, :postal_code, :condo_address, :floor, :basement_floor, :total_number_of_unit, :completion_year, :structure_id, :site_area, :total_floor_area, :parking_space, :bicycle_parking_space, :maintenance_fee, :repair_reserve_fund, :management_company_name, :management_company_postal_code, :management_company_address, :management_company_phone_number, :management_type_id, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.inputs 'Condo Details' do
      f.input :condo_name
      f.input :postal_code
      f.input :condo_address
      f.input :floor
      f.input :basement_floor
      f.input :total_number_of_unit
      f.input :completion_year
      f.input :structure
      f.input :site_area
      f.input :total_floor_area
      f.input :parking_space
      f.input :bicycle_parking_space
      f.input :maintenance_fee
      f.input :repair_reserve_fund
      f.input :management_company_name
      f.input :management_company_postal_code
      f.input :management_company_address
      f.input :management_company_phone_number
      f.input :management_type
      f.input :user, as: :select, collection: User.all.map { |user| [user.last_name + user.first_name, user.id] }
    end
    f.actions
  end
  # Ransackを使用しないように検索機能を無効にする
  config.filters = false
end
