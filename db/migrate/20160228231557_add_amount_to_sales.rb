class AddAmountToSales < ActiveRecord::Migration
  def change
    add_column :sales, :amount, :string
    add_column :sales, :integer, :string
  end
end
