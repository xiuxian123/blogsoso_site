# -*- encoding : utf-8 -*-
# This migration comes from loyal_passport (originally 20121123025990)
# -*- encoding : utf-8 -*-
class CreateLoyalPassportRoles < ActiveRecord::Migration
  def change
    create_table :loyal_passport_roles do |t|
      t.string  :permalink,      :default => '', :null => false
      t.string  :name,           :default => '', :null => false

      # 简介
      t.string  :instroduction
      # 描述
      t.text    :description

      t.integer :publish_status, :default => 0,  :null => false

      ##### soft deleted #######################
      t.datetime :deleted_at

      ###### avatar #############################
      t.string :avatar
    end

    add_index :loyal_passport_roles, [:permalink]
  end
end
