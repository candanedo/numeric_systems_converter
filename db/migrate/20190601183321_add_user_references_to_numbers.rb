class AddUserReferencesToNumbers < ActiveRecord::Migration[5.2]
  def change
    add_column :numbers, :user_id, :integer
    add_index :numbers, :user_id
  end
end
