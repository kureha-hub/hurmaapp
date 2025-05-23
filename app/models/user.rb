class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_many :tweets, dependent: :destroy
  
  has_many :likes, dependent: :destroy
  has_many :liked_tweets, through: :likes, source: :tweet

  def already_liked?(tweet)
    self.likes.exists?(tweet_id: tweet.id)
  end
  
  # Devise 4.9+ 向け: セッション復元対応（Warden対応）
  def self.serialize_from_session(key, salt, auth_options = nil, stored_options = nil)
    record = to_adapter.get(key)
    record if record && record.authenticatable_salt == salt
  end
end
