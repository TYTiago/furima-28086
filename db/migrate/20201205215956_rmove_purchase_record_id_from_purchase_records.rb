class RmovePurchaseRecordIdFromPurchaseRecords < ActiveRecord::Migration[6.0]
  def change
    remove_column :purchase_records, :purchase_record_id, :integer
  end
end
