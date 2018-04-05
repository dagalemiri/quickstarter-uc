class AddCurrentToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :current, :integer
  end
end
