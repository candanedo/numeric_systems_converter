class AddColumnsToNumbers < ActiveRecord::Migration[5.2]
  def change
    add_column :numbers, :decimal, :integer
    add_column :numbers, :binary, :string
    add_column :numbers, :octal, :string
    add_column :numbers, :hexadecimal, :string
  end
end
