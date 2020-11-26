class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.integer :user_id, null: false, foreign_key: true
      t.integer :price, null: false
      t.integer :date_id, null: false
      t.text :description, null: false
      t.integer :category_id, null: false
      t.integer :area_id, null: false
      t.integer :delivery_id, null: false
      t.integer :status_id, null: false
      t.timestamps
    end
  end
end
