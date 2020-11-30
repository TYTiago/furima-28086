class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  with_options presence: true do
    validates :title
    validates :user_id 
    validates :description
    validates :price, format: { with: /\A[0-9]+\z/}, numericality: { only_integer: true, greater_than: 300, less_than: 9999999}  
    validates :date_delivery_id, numericality: {greater_than_or_equal_to:1 }
    validates :category_id, numericality: {greater_than_or_equal_to:1 } #カテゴリー
    validates :area_id, numericality: {greater_than_or_equal_to:1 } #県
    validates :delivery_id, numericality: {greater_than_or_equal_to:1 } #配達
    validates :status_id, numericality: {greater_than_or_equal_to:1 } #状態
    validates :image, unless: :was_attached?
  end
  def was_attached?
    self.image.attached?
  end
end
