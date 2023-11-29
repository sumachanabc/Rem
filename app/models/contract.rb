class Contract < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condo
  belongs_to :condo_user
  belongs_to :parking
  belongs_to :vehicle_type, class_name: 'VehicleType', foreign_key: 'vehicle_type_id'

  validates :start_date, presence: true
  validates :end_date, presence: true

  validate :validate_date_overlap_within_condo

  private

  def validate_date_overlap_within_condo
    # 駐車場のcondo_idを取得
    condo_id = self.parking.condo_id
  
    # 同じマンションの同じ種類の区画の他の契約を取得
    other_contracts = Contract.joins(:parking).where(parkings: { condo_id: condo_id, parking_type_id: self.parking.parking_type_id })
  
    # 現在の契約を除外（更新時に自分自身との重複をチェックしないため）
    other_contracts = other_contracts.where.not(id: id) if persisted?
  
    # 重複チェック
    is_overlapping = other_contracts.any? do |contract|
      start_date < contract.end_date && end_date > contract.start_date
    end
  
    # エラーメッセージの追加
    errors.add(:base, '契約期間が他の契約と重複しています') if is_overlapping
  end
  

end
