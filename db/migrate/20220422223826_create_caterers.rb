# frozen_string_literal: true

class CreateCaterers < ActiveRecord::Migration[6.1]
  def change
    create_table :caterers do |t|
      t.string :address, null: false
      t.string :name, null: false
      t.string :city, null: false
      t.string :cloudinary_image_url
      t.text :description, null: false
      t.float :latitude
      t.float :longitude
      t.integer :radius_drop_off, null: false, default: 25
      t.integer :radius_on_site, null: false, default: 25
      t.integer :radius_pick_up, null: false, default: 25
      t.string :slug, null: false
      t.string :state, null: false
      t.string :zip, null: false
      t.timestamps
    end

    add_index :caterers, :name
    add_index :caterers, :slug
    add_index :caterers, %i[latitude longitude]
  end
end
