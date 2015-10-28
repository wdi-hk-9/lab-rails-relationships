class Relationship < ActiveRecord::Migration
  def change
    add_reference :recipes, :course
  end
end
