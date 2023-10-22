ActiveAdmin.register CondoUser do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :room_number, :condo_user_last_name, 
                :condo_user_first_name, :condo_user_last_name_kana, 
                :condo_user_first_name_kana, :condo_user_address, 
                :condo_user_phone_number, :condo_id, :email, 
                :encrypted_password, :reset_password_token, 
                :reset_password_sent_at, :remember_created_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:room_number, :condo_user_last_name, :condo_user_first_name, :condo_user_last_name_kana, :condo_user_first_name_kana, :condo_user_address, :condo_user_phone_number, :condo_id, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end


  index do
    selectable_column
    id_column

    column :condo, sortable: :condo_id do |condo_user|
      condo_user.condo.condo_name
    end
    column :room_number
    column :condo_user_last_name
    column :condo_user_first_name
    column :condo_user_last_name_kana
    column :condo_user_first_name_kana
    column :condo_user_address
    column :condo_user_phone_number
    column :email
    column :created_at
    column :updated_at

    actions
  end

  form do |f|
    f.inputs 'User Details' do
      f.input :condo, as: :select, collection: Condo.all.map { |condo| [condo.condo_name, condo.id] }
      f.input :room_number
      f.input :condo_user_last_name
      f.input :condo_user_first_name
      f.input :condo_user_last_name_kana
      f.input :condo_user_first_name_kana
      f.input :condo_user_address
      f.input :condo_user_phone_number
      f.input :email
      if f.object.new_record?
        # 新規作成の場合のみパスワード入力を表示
        f.input :password
        f.input :password_confirmation
      end
    end
    f.actions
  end
  # Ransackを使用しないように検索機能を無効にする
  config.filters = false
end
