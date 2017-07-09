class CreateMatches < ActiveRecord::Migration[5.1]
  def up
    create_table :matches do |t|
      t.integer :matcher_user_id
      t.integer :matched_user_id
      t.datetime :time_matched
    end

    add_index(:matches, :matcher_user_id, unique: false, name: 'matcher_nonunique_idx')
  end

  def down
    drop_table :matches
    remove_index :matches, name: :matcher_nonunique_idx
  end
end
