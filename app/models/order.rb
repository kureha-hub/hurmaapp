class Order < ApplicationRecord
  belongs_to :tweet
  belongs_to :buyer, class_name: "User"
  has_many :messages
  has_many :messages, dependent: :destroy
end
