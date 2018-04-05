class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :image
      t.integer :goal
      t.date :limit_date
      t.references :user, foreign_key: true


      t.timestamps
    end
  end
end
