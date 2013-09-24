# This migration comes from loyal_passport (originally 20130625055117)
# -*- encoding : utf-8 -*-
class AddGenderToUsers < ActiveRecord::Migration
  def change
    # 性别
    add_column :users, :gender, :integer, :default => 0, :null => false, :limit => 1
  end
end
