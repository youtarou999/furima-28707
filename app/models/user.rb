class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items

  validates :name,                  presence: true
  validates :email,                 presence: true
  
  validates :password,              presence: true, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '英字と数字の両方を含めて設定してください'} 
  validates :password_confirmation, presence: true, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '英字と数字の両方を含めて設定してください'} 


  validates :family_name,           presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください'} 
  validates :first_name,            presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください'} 

  
  validates :family_name_kana,      presence: true, format: {with: /\A[ァ-ン]+\z/, message: '全角カナを使用してください' } 
  validates :first_name_kana,       presence: true, format: {with: /\A[ァ-ン]+\z/, message: '全角カナを使用してください' }
  

  validates :birthday,              presence: true

  
end

