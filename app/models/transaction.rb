class Transaction < ApplicationRecord

has_one :destination
belong_to :user
belong_to :item


end