class RenameMessageToImage < ActiveRecord::Migration[6.0]
  def change
    rename_table :messages, :images
  end
end
