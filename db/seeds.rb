# ---管理会社---

# admin
User.create!(
  first_name: '一郎',
  last_name: '管理者',
  first_name_kana: 'イチロウ',
  last_name_kana: 'カンリシャ',
  email: 'fff@gmail.com',
  password: 'fff444',
  password_confirmation: 'fff444',
  role: 1
)

# manage
User.create!(
  first_name: '二郎',
  last_name: '役職',
  first_name_kana: 'ジロウ',
  last_name_kana: 'ヤクショク',
  email: 'jjj@gmail.com',
  password: '444fff',
  password_confirmation: '444fff',
  role: 2
)

# employee
User.create!(
  first_name: '三郎',
  last_name: '社員',
  first_name_kana: 'サブロウ',
  last_name_kana: 'シャイン',
  email: 'qqq@gmail.com',
  password: '111qqq',
  password_confirmation: '111qqq',
  role: 0
)

User.create!(
  first_name: '四郎',
  last_name: '社員',
  first_name_kana: 'シロウ',
  last_name_kana: 'シャイン',
  email: 'www@gmail.com',
  password: '222www',
  password_confirmation: '222www',
  role: 0
)

User.create!(
  first_name: '五郎',
  last_name: '社員',
  first_name_kana: 'ゴロウ',
  last_name_kana: 'シャイン',
  email: 'eee@gmail.com',
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
management_company_name = 'TECH渋谷'
management_company_address = '東京都千代田区4-5-6'
management_company_phone_number = '03-1234-5678'

Condo.create!(
  condo_name: 'TECH渋谷',
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
  management_company_address: management_company_address,
  management_company_phone_number: management_company_phone_number,
  parking_space: nil,
  bicycle_parking_space: 20,
  maintenance_fee: 200.0,
  repair_reserve_fund: 150.0,
  user_id: 3
)

Condo.create!(
  condo_name: 'モダンパーク',
  condo_address: '東京都渋谷区1-2-3',
  floor: 4,
  basement_floor: nil,
  total_number_of_unit: 10,
  completion_year: 2015,
  structure_id: structure_id,
  site_area: 500.0,
  total_floor_area: 2000.0,
  management_type_id: management_type_id,
  management_company_name: management_company_name,
  management_company_address: management_company_address,
  management_company_phone_number: management_company_phone_number,
  parking_space: nil,
  bicycle_parking_space: 15,
  maintenance_fee: 180.0,
  repair_reserve_fund: 120.0,
  user_id: 3
)

Condo.create!(
  condo_name: 'サンライズヒルズ',
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
  management_company_address: management_company_address,
  management_company_phone_number: management_company_phone_number,
  parking_space: nil,
  bicycle_parking_space: 10,
  maintenance_fee: 190.0,
  repair_reserve_fund: 130.0,
  user_id: 3
)

Condo.create!(
  condo_name: 'グリーンコート',
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
  management_company_address: management_company_address,
  management_company_phone_number: management_company_phone_number,
  parking_space: nil,
  bicycle_parking_space: 12,
  maintenance_fee: 200.0,
  repair_reserve_fund: 140.0,
  user_id: 4
)

Condo.create!(
  condo_name: 'アーバンパレス',
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
  management_company_address: management_company_address,
  management_company_phone_number: management_company_phone_number,
  parking_space: nil,
  bicycle_parking_space: 14,
  maintenance_fee: 180.0,
  repair_reserve_fund: 120.0,
  user_id: 4
)

# ---------------

