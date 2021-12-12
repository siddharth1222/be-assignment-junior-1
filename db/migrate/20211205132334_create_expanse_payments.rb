# frozen_string_literal: true

class CreateExpansePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :expanse_payments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :expanse, null: false, foreign_key: true
      t.bigint :paid_by_id, null: false, foreign_key: true
      t.boolean :status, default: false
      # t.string :payment_method, default: 'cash'

      t.timestamps
    end
  end
end
