class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :recipes, :name, :title
  end
end
