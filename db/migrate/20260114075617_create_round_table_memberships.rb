class CreateRoundTableMemberships < ActiveRecord::Migration[8.1]
  def change
    create_table :round_table_memberships do |t|
      t.integer :member_id
      t.integer :joined_round_table_id
      t.timestamps
    end

    add_index :round_table_memberships, :member_id
    add_index :round_table_memberships, :joined_round_table_id
    add_index :round_table_memberships, [ :member_id, :joined_round_table_id], unique: true
  end
end
