class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :sex
      t.date :birth_date
      t.string :password
      t.string :description
      t.string :image
      t.string :role



      t.timestamps
    end
  end
end
