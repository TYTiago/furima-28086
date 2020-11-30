class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  with_options presence: true do
    validates :title
    validates :user_id 
    validates :description
    validates :price, format: { with: /\A[0-9]+\z/}, numericality: { only_integer: true, greater_than: 299, less_than: 10000000}  
    validates :date_delivery_id
    validates :category_id
    validates :area_id
    validates :delivery_id
    validates :status_id
    validates :image, unless: :was_attached?
  end

  with_options numericality: {greater_than_or_equal_to:1 } do
    validates :date_delivery_id 
    validates :category_id 
    validates :area_id 
    validates :delivery_id 
    validates :status_id 
  end
  
  def was_attached?
    self.image.attached?
  end
end
