# frozen_string_literal: true

class AddUserReferenceToGroups < ActiveRecord::Migration[7.1]
  def change
    add_reference :groups, :user, null: false, foreign_key: true
  end
end
