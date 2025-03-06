class User < ApplicationRecord
  has_many :auctions, dependent: :destroy
  has_many :bids, dependent: :destroy

  validates_presence_of :password
  validates_presence_of :email
  
end
