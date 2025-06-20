class Message < ApplicationRecord
  belongs_to :user
  belongs_to :order

  validates :body, presence: true
end
