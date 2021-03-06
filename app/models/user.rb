class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
         has_many :items
         has_many :purchase_records
      
        with_options presence: true do
          validates :nickname
          validates :birth_date

         with_options format: { with: /\A[ぁ-んァ-ン一-龥]/} do
           validates :first_name
           validates :last_name
         end

         with_options format: { with: /\A[ァ-ヶー－]+\z/} do
           validates :first_name_kana
           validates :last_name_kana
         end
        end
        PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
        validates_format_of :password, with: PASSWORD_REGEX, length: { minimum: 6 }
        validates_format_of :password_confirmation, with: PASSWORD_REGEX, length: { minimum: 6 }
        validates :email, uniqueness: true, format: { with: /\A\S+@\S+\z/}

end