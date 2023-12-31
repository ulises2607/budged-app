# frozen_string_literal: true

class Payment < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.string :name, null: false
      t.decimal :amount, null: false, precision: 10, scale: 2
      t.timestamps
    end
  end
end
