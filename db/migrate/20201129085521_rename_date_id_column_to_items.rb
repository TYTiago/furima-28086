class RenameDateIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :date_id, :date_delivery_id
  end
end
