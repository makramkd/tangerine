class CreateSwipes < ActiveRecord::Migration[5.1]
  def up
    create_table :swipes do |t|
      t.integer :swiper_user_id
      t.integer :swipee_user_id
      t.datetime :time_swiped
      t.integer :direction
    end
    add_index(:swipes, [:swiper_user_id, :swipee_user_id],
             unique: true, name: 'swiper_swipee_unique_idx')
  end

  def down
    drop_table :swipes
    remove_index :swipes, name: :swiper_swipee_unique_idx
  end
end
