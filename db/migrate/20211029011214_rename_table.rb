class RenameTable < ActiveRecord::Migration[6.1]
  def change
    rename_table :product_categories , :category_products
  end
end
