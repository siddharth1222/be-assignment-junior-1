# frozen_string_literal: true

class CreateExpanses < ActiveRecord::Migration[6.1]
  def change
    create_table :expanses do |t|
      t.string :title
      t.decimal :amount
      t.string :type
      t.boolean :status, default: false
      t.bigint :paid_by_id
      t.bigint :created_by_id

      t.timestamps
    end
  end
end
