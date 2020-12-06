class PurchaseRecord < ApplicationRecord
  belongs_to :user
   has_one :street_address
   belongs_to :item
end
