class User < ApplicationRecord
  has_many :auctions, dependent: :destroy
end
