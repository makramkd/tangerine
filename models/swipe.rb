class Swipe < ActiveRecord::Base
  validates_presence_of :swiper_user_id
  validates_presence_of :swipee_user_id
  validates_presence_of :direction
end
