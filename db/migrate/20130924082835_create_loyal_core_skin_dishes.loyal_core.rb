# This migration comes from loyal_core (originally 20130610095938)
# -*- encoding : utf-8 -*-
class CreateLoyalCoreSkinDishes < ActiveRecord::Migration
  def change
    create_table :loyal_core_skin_dishes do |t|

      t.references :target, :polymorphic => true

      t.integer :recipe_id

      t.timestamps
    end
  end
end
