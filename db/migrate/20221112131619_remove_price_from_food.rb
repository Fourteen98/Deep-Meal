class RemovePriceFromFood < ActiveRecord::Migration[7.0]
  def change
    remove_column :foods, :price, :decimal
  end
end
