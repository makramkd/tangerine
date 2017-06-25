class CreateUsers < ActiveRecord::Migration[5.1]
  def up
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :gender
      t.integer :age
      t.text :bio
    end
  end

  def down
    drop_table :table_name
  end
end
