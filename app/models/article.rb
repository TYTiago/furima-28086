class Article <  ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :date_delivery 
  belongs_to :category 
  belongs_to :area 
  belongs_to :delivery 
  belongs_to :status 
  
  
  with_options presence: true do
    validates :date_delivery_id 
    validates :category_id 
    validates :area_id 
    validates :delivery_id 
    validates :status_id 
  end

  validates :date_delivery_id , numericality: { other_than: 1 }
  validates :category_id, numericality: { other_than: 1 }
  validates :area_id, numericality: { other_than: 1 }
  validates :delivery_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
end
