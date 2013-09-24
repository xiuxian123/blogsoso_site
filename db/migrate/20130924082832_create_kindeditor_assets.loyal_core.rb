# This migration comes from loyal_core (originally 20130413061851)
# -*- encoding : utf-8 -*-
class CreateKindeditorAssets < ActiveRecord::Migration
  def self.up
    create_table :kindeditor_assets do |t|
      t.string :asset
      t.string :file_name
      t.integer :file_size
      t.string :file_type
      t.timestamps
    end
  end

  def self.down
    drop_table :kindeditor_assets
  end
end

