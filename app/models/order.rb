class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_one :destination
  belongs_to :user
  belongs_to :item
  belongs_to_active_hash :prefecture
end
