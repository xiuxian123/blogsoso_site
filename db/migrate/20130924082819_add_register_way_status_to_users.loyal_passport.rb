# -*- encoding : utf-8 -*-
# This migration comes from loyal_passport (originally 20130918092035)
class AddRegisterWayStatusToUsers < ActiveRecord::Migration
  def change
    # 注册方式
    add_column :users, :register_way_status, :integer, :default => 0, :null => false
  end
end
