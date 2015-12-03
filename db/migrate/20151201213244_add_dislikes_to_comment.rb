class AddDislikesToComment < ActiveRecord::Migration
  def change
    add_column :comments, :dislikes, :integer, default: 0
  end
end
