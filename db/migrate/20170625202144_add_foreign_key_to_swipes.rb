class AddForeignKeyToSwipes < ActiveRecord::Migration[5.1]
  def up
    add_foreign_key :swipes, :users,
      column: :swiper_user_id
    add_foreign_key :swipes, :users,
      column: :swipee_user_id
  end

  def down
    remove_foreign_key :swipes, column: :swiper_user_id
    remove_foreign_key :swipes, column: :swipee_user_id
  end
end
