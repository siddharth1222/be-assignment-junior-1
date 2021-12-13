# frozen_string_literal: true

class CreateUserFriends < ActiveRecord::Migration[6.1]
  def change
    create_table :user_friends do |t|
      t.bigint :receiver_id, null: false
      t.bigint :sender_id, null: false

      t.timestamps
    end
  end
end
