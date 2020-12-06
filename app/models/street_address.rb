class StreetAddress < ApplicationRecord
  attr_accessor :token
  belongs_to :purchase_record
end