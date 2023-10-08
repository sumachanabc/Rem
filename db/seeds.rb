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
  email: 'fffjjj@gmail.com',
  password: 'jjff44',
  password_confirmation: 'jjff44',
  role: 0
)
