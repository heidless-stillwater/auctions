class AddUserToAuctions < ActiveRecord::Migration[7.2]
  def change
    add_reference :auctions, :user, null: false, foreign_key: true
  end
end
