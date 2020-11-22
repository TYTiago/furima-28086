class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :password, format: { with: /\A[a-zA-Z0-9]+\z/}, length: { minimum: 6 } 
         validates :email, uniqueness: true, format: { with:  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
         validates :nickname, presence: true 
         validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/}
         validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/}
         validates :first_name_kana , presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
         validates :last_name_kana , presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
         validates :birth_date , presence: true



end
