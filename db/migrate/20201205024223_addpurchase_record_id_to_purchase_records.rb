class AddpurchaseRecordIdToPurchaseRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :purchase_records, :purchase_record_id, :integer
  end
end
