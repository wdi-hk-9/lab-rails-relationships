class ChangeColumnName2 < ActiveRecord::Migration
  def change
    rename_column :recipes, :instruction, :instructions
    rename_column :recipes, :serving, :servings
  end
end
