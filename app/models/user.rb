class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :orders
  #has_one  :destination

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
  KANA_REGEX = /\A[ァ-ン]+\z/

  with_options presence: true do
    validates :name                  
    validates :email                
    validates :password,               format: {with: PASSWORD_REGEX, message: '英字と数字の両方を含めて設定してください'} 
    validates :password_confirmation,  format: {with: PASSWORD_REGEX, message: '英字と数字の両方を含めて設定してください'} 
    validates :family_name,            format: {with: NAME_REGEX, message: '全角文字を使用してください'} 
    validates :first_name,             format: {with: NAME_REGEX, message: '全角文字を使用してください'} 
    validates :family_name_kana,       format: {with: KANA_REGEX, message: '全角カナを使用してください' } 
    validates :first_name_kana,        format: {with: KANA_REGEX, message: '全角カナを使用してください' }
    validates :birthday
  end
end

