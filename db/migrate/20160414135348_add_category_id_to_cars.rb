class AddCategoryIdToCars < ActiveRecord::Migration
  def change
    add_column :cars, :category_id, :integer
  end
end
