# ---管理会社---

# admin
admin_user = User.create!(
  first_name: '一郎',
  last_name: '管理者',
  first_name_kana: 'イチロウ',
  last_name_kana: 'カンリシャ',
  email: 'fff@example.com',
  password: 'fff444',
  password_confirmation: 'fff444',
  role: 1
)

# adminユーザーのIDを取得
admin_user_id = admin_user.id

# manage
manage_user = User.create!(
  first_name: '二郎',
  last_name: '役職',
  first_name_kana: 'ジロウ',
  last_name_kana: 'ヤクショク',
  email: 'jjj@example.com',
  password: '444fff',
  password_confirmation: '444fff',
  role: 2
)

# employee
employee_users = []
employee_users << User.create!(
  first_name: '三郎',
  last_name: '社員',
  first_name_kana: 'サブロウ',
  last_name_kana: 'シャイン',
  email: 'qqq@example.com',
  password: '111qqq',
  password_confirmation: '111qqq',
  role: 0
)

employee_users << User.create!(
  first_name: '四郎',
  last_name: '社員',
  first_name_kana: 'シロウ',
  last_name_kana: 'シャイン',
  email: 'www@example.com',
  password: '222www',
  password_confirmation: '222www',
  role: 0
)

employee_users << User.create!(
  first_name: '五郎',
  last_name: '社員',
  first_name_kana: 'ゴロウ',
  last_name_kana: 'シャイン',
  email: 'eee@example.com',
  password: '333eee',
  password_confirmation: '333eee',
  role: 0
)

# ---------------

# ---マンション---

# マンション作成時に使用するManagementTypeおよびStructureを取得
management_type_id = ManagementType.find_by(name: '全部委託').id
structure_id = Structure.find_by(name: 'SRC造').id

# 管理会社情報
management_company_name = 'TECH管理株式会社'
management_company_postal_code = '101-1010'
management_company_address = '東京都千代田区4-5-6'
management_company_phone_number = '0312345678'

condos = []
condos << Condo.create!(
  condo_name: 'サンコート',
  postal_code: '111-1111',
  condo_address: '東京都渋谷区1-2-3',
  floor: 4,
  basement_floor: nil,
  total_number_of_unit: 12,
  completion_year: 2010,
  structure_id: structure_id,
  site_area: 400.0,
  total_floor_area: 1800.0,
  management_type_id: management_type_id,
  management_company_name: management_company_name,
  management_company_postal_code: management_company_postal_code,
  management_company_address: management_company_address,
  management_company_phone_number: management_company_phone_number,
  maintenance_fee: 200.0,
  repair_reserve_fund: 150.0,
  user_id: employee_users[0].id
)

condos << Condo.create!(
  condo_name: 'モダンパーク',
  postal_code: '111-2222',
  condo_address: '東京都北区1-2-3',
  floor: 4,
  basement_floor: nil,
  total_number_of_unit: 10,
  completion_year: 2015,
  structure_id: structure_id,
  site_area: 500.0,
  total_floor_area: 2000.0,
  management_type_id: management_type_id,
  management_company_name: management_company_name,
  management_company_postal_code: management_company_postal_code,
  management_company_address: management_company_address,
  management_company_phone_number: management_company_phone_number,
  maintenance_fee: 180.0,
  repair_reserve_fund: 120.0,
  user_id: employee_users[0].id
)

condos << Condo.create!(
  condo_name: 'サンライズヒルズ',
  postal_code: '111-3333',
  condo_address: '東京都新宿区4-5-6',
  floor: 5,
  basement_floor: nil,
  total_number_of_unit: 9,
  completion_year: 2012,
  structure_id: structure_id,
  site_area: 480.0,
  total_floor_area: 2100.0,
  management_type_id: management_type_id,
  management_company_name: management_company_name,
  management_company_postal_code: management_company_postal_code,
  management_company_address: management_company_address,
  management_company_phone_number: management_company_phone_number,
  maintenance_fee: 190.0,
  repair_reserve_fund: 130.0,
  user_id: employee_users[0].id
)

condos << Condo.create!(
  condo_name: 'グリーンコート',
  postal_code: '111-4444',
  condo_address: '東京都港区7-8-9',
  floor: 6,
  basement_floor: nil,
  total_number_of_unit: 11,
  completion_year: 2013,
  structure_id: structure_id,
  site_area: 520.0,
  total_floor_area: 2200.0,
  management_type_id: management_type_id,
  management_company_name: management_company_name,
  management_company_postal_code: management_company_postal_code,
  management_company_address: management_company_address,
  management_company_phone_number: management_company_phone_number,
  maintenance_fee: 200.0,
  repair_reserve_fund: 140.0,
  user_id: employee_users[1].id
)

condos << Condo.create!(
  condo_name: 'アーバンパレス',
  postal_code: '111-5555',
  condo_address: '東京都中央区10-11-12',
  floor: 3,
  basement_floor: nil,
  total_number_of_unit: 10,
  completion_year: 2014,
  structure_id: structure_id,
  site_area: 490.0,
  total_floor_area: 1900.0,
  management_type_id: management_type_id,
  management_company_name: management_company_name,
  management_company_postal_code: management_company_postal_code,
  management_company_address: management_company_address,
  management_company_phone_number: management_company_phone_number,
  maintenance_fee: 180.0,
  repair_reserve_fund: 120.0,
  user_id: employee_users[1].id
)

# ---------------

# ---区分所有者---

require 'gimei'

common_password = '1a1a1a'
room_numbers = [101, 102, 103, 201, 202, 203, 301, 302, 303, 401, 402, 403]
phone_numbers = Array.new(12) { "080#{rand(10000000..99999999)}" }

12.times do |index|
  gimei = Gimei.new

  email = "a#{format('%02d', index + 1)}@example.com"

  address = if index < 2
              Gimei.address.kanji
            else
              '東京都渋谷区1-2-3'
            end

  CondoUser.create!(
    email: email,
    password: common_password,
    password_confirmation: common_password,
    room_number: room_numbers[index],
    condo_user_last_name: gimei.last.kanji,
    condo_user_first_name: gimei.first.kanji,
    condo_user_last_name_kana: gimei.last.katakana,
    condo_user_first_name_kana: gimei.first.katakana,
    condo_user_address: address,
    condo_user_phone_number: phone_numbers[index],
    condo_id: condos[0].id,
    user_id: employee_users[0].id
  )
end

require 'gimei'

common_password = '1a1a1a'
room_numbers = [101, 102, 103, 201, 202, 203, 301, 302, 303, 401]
phone_numbers = Array.new(10) { "080#{rand(10000000..99999999)}" }

10.times do |index|
  gimei = Gimei.new
  email = "b#{format('%02d', index + 1)}@example.com"
  address = if [0, 1].include?(index)
              Gimei.address.kanji
            else
              '東京都北区1-2-3'
            end

  CondoUser.create!(
    email: email,
    password: common_password,
    password_confirmation: common_password,
    room_number: room_numbers[index],
    condo_user_last_name: gimei.last.kanji,
    condo_user_first_name: gimei.first.kanji,
    condo_user_last_name_kana: gimei.last.katakana,
    condo_user_first_name_kana: gimei.first.katakana,
    condo_user_address: address,
    condo_user_phone_number: phone_numbers[index],
    condo_id: condos[1].id,
    user_id: employee_users[0].id
  )
end

require 'gimei'

common_password = '1a1a1a'
room_numbers = [101, 102, 201, 202, 301, 302, 401, 402, 501]
phone_numbers = Array.new(9) { "080#{rand(10000000..99999999)}" }

9.times do |index|
  gimei = Gimei.new
  email = "c#{format('%02d', index + 1)}@example.com"
  address = if [0, 1].include?(index)
              Gimei.address.kanji
            else
              '東京都新宿区4-5-6'
            end

  CondoUser.create!(
    email: email,
    password: common_password,
    password_confirmation: common_password,
    room_number: room_numbers[index],
    condo_user_last_name: gimei.last.kanji,
    condo_user_first_name: gimei.first.kanji,
    condo_user_last_name_kana: gimei.last.katakana,
    condo_user_first_name_kana: gimei.first.katakana,
    condo_user_address: address,
    condo_user_phone_number: phone_numbers[index],
    condo_id: condos[2].id,
    user_id: employee_users[0].id
  )
end

require 'gimei'

common_password = '1a1a1a'
room_numbers = [101, 102, 201, 202, 301, 302, 401, 402, 501, 502, 601]
phone_numbers = Array.new(11) { "080#{rand(10000000..99999999)}" }

11.times do |index|
  gimei = Gimei.new
  email = "d#{format('%02d', index + 1)}@example.com"
  address = if [0, 1].include?(index)
              Gimei.address.kanji
            else
              '東京都港区7-8-9'
            end

  CondoUser.create!(
    email: email,
    password: common_password,
    password_confirmation: common_password,
    room_number: room_numbers[index],
    condo_user_last_name: gimei.last.kanji,
    condo_user_first_name: gimei.first.kanji,
    condo_user_last_name_kana: gimei.last.katakana,
    condo_user_first_name_kana: gimei.first.katakana,
    condo_user_address: address,
    condo_user_phone_number: phone_numbers[index],
    condo_id: condos[3].id,
    user_id: employee_users[1].id
  )
end

require 'gimei'

common_password = '1a1a1a'
room_numbers = [101, 102, 103, 104, 201, 202, 203, 301, 302, 303]
phone_numbers = Array.new(10) { "080#{rand(10000000..99999999)}" }

10.times do |index|
  gimei = Gimei.new
  email = "e#{format('%02d', index + 1)}@example.com"
  address = if [0, 1].include?(index)
              Gimei.address.kanji
            else
              '東京都中央区10-11-12'
            end

  CondoUser.create!(
    email: email,
    password: common_password,
    password_confirmation: common_password,
    room_number: room_numbers[index],
    condo_user_last_name: gimei.last.kanji,
    condo_user_first_name: gimei.first.kanji,
    condo_user_last_name_kana: gimei.last.katakana,
    condo_user_first_name_kana: gimei.first.katakana,
    condo_user_address: address,
    condo_user_phone_number: phone_numbers[index],
    condo_id: condos[4].id,
    user_id: employee_users[1].id
  )
end

condo_user_post = CondoUserPost.create!(
  title: '共有施設の予約方法について',
  content: 'いつもお世話になっております。共有の会議室を利用したいのですが、予約方法を教えてください。',
  status: 0,
  condo_user_id: CondoUser.first.id,
  condo_id: Condo.first.id
)

comments = [
  { content: 'いつもお世話になっております。お問い合わせありがとうございます。会議室の予約は、管理事務所から行うことができます。管理員までお申し付けくださいませ。', user_id: User.first.id },
  { content: '管理事務所での予約了解しました。ちなみに食べ物の持込みは可能ですか？', condo_user_id: CondoUser.first.id },
  { content: '食べ物の持込みは可能です。退室前に備え付けの掃除機で掃除をお願いいたします。', user_id: User.first.id },
  { content: '承知いたしました。ありがとうございました。', condo_user_id: CondoUser.first.id }
]

comments.each do |comment|
  CondoUserPostReply.create!(
    content: comment[:content],
    user_id: comment[:user_id],
    condo_user_id: comment[:condo_user_id],
    condo_user_post_id: condo_user_post.id
  )
end

# ---書類---
documents_to_upload = [
  { filename: '管理委託契約サンプル.pdf', title: '第13期管理委託契約書', category_id: 6 },
  { filename: '管理規約.pdf', title: '管理規約', category_id: 7 },
  { filename: '総会資料サンプル.pdf', title: '第13期通常総会資料', category_id: 2 },
  { filename: '総会議事録サンプル.pdf', title: '第13期通常総会議事録', category_id: 3 },
  { filename: '長期修繕計画サンプル.pdf', title: '長期修繕計画(第13期承認)', category_id: 9 },
  { filename: '理事会資料サンプル.pdf', title: '第13期理事会資料', category_id: 4 },
  { filename: '理事会議事録サンプル.pdf', title: '第13期理事会議事録', category_id: 5 }
]

documents_to_upload.each do |doc|
  pdf_path = Rails.root.join('db', 'seeds', 'files', doc[:filename])

  document = Document.new(
    title: doc[:title],
    category_id: doc[:category_id],
    user: admin_user,
    condo: condos[0]
  )

  document.file.attach(io: File.open(pdf_path), filename: doc[:filename], content_type: 'application/pdf')
  document.save!
end

# ---区画情報---
# 各マンションに対して駐輪場区画1-10番、駐車場1,2番を全て平置きで特別カテゴリなしで生成
condos.each do |condo|
  # 駐輪場区画1-10番の初期データ
  (1..10).each do |number|
    Parking.create!(
      condo_id: condo.id,
      parking_number: number.to_s,
      vehicle_type_id: 3,
      monthly_fee: 300,
      parking_type_id: 2,
      roof: false,
      special_category_id: nil,
      user_id: admin_user_id
    )
  end

  # 駐車場1,2番の初期データ
  (1..2).each do |number|
    Parking.create!(
      condo_id: condo.id,
      parking_number: number.to_s,
      vehicle_type_id: 2,
      monthly_fee: 15000,
      parking_type_id: 2,
      roof: false,
      special_category_id: nil,
      user_id: admin_user_id
    )
  end
end

# ‐‐‐区画契約‐‐‐

car_model_codes = ['DBA-ZC6', 'UA-NCP31', 'GH-ANH10', 'LDA-GDJ150W', 'CBA-R35']

condos.each do |condo|

  start_date = Date.new(2023, 4, 1)
  end_date = Date.new(2025, 3, 31)

  # 駐輪場区画1-10番の契約データ作成
  (1..10).each do |number|
    parking = Parking.find_by(condo_id: condo.id, parking_number: number.to_s, vehicle_type_id: 3)
    Contract.create!(
      vehicle_number: nil,
      vehicle_type_id: parking.vehicle_type_id,
      vehicle_model_code: nil,
      start_date: start_date,
      end_date: end_date,
      condo_id: condo.id,
      condo_user_id: condo.condo_users.sample.id,
      parking_id: parking.id,
      user_id: admin_user_id
    )
  end

  # 駐車場1,2番の契約データ作成
  (1..2).each do |number|
    parking = Parking.find_by(condo_id: condo.id, parking_number: number.to_s, vehicle_type_id: 2)

    vehicle_number = "東京 #{rand(1000..9999)}"
    
    vehicle_model_code = car_model_codes.sample

    Contract.create!(
      vehicle_number: vehicle_number,
      vehicle_type_id: parking.vehicle_type_id,
      vehicle_model_code: vehicle_model_code,
      start_date: start_date,
      end_date: end_date,
      condo_id: condo.id,
      condo_user_id: condo.condo_users.sample.id,
      parking_id: parking.id,
      user_id: admin_user_id
    )
  end
end

