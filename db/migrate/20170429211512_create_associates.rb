class CreateAssociates < ActiveRecord::Migration[5.0]
  def change
    create_table :associates do |t|
      t.references :project, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
