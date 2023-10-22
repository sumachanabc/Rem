ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :last_name, :first_name, :last_name_kana, 
                :first_name_kana, :email, :password, :password_confirmation, 
                :reset_password_sent_at, :remember_created_at, :role
  #
  # or
  #
  # permit_params do
  #   permitted = [:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :role]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    id_column

    column :last_name
    column :first_name
    column :last_name_kana
    column :first_name_kana
    column :email
    column :role
    column :created_at
    column :updated_at
    
    actions
  end

  form do |f|
    f.inputs "User Details" do
      f.input :last_name
      f.input :first_name
      f.input :last_name_kana
      f.input :first_name_kana
      f.input :email
      if f.object.new_record?
        # 新規作成の場合のみパスワード入力を表示
        f.input :password
        f.input :password_confirmation
      end
      f.input :role
    end
    f.actions
  end
  # Ransackを使用しないように検索機能を無効にする
  config.filters = false
end
