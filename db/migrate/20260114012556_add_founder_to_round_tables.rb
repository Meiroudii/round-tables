class AddFounderToRoundTables < ActiveRecord::Migration[8.1]
  def change
    add_column :round_tables, :founder_id, :integer
    add_index :round_tables, :founder_id
  end
end
