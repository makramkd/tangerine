class Swipe < ActiveRecord::Base
  validates_presence_of :swiper_user_id
  validates_presence_of :swipee_user_id
  validates_presence_of :direction

  DIRECTION_RIGHT = 0
  DIRECTION_LEFT  = 1

  def hashify
    {
      id: self.id,
      swiper_user_id: self.swiper_user_id,
      swipee_user_id: self.swipee_user_id,
      direction: self.direction,
      time_swiped: self.time_swiped,
    }
  end
end
