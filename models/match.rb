class Match < ActiveRecord::Base
  validates_presence_of :matcher_user_id
  validates_presence_of :matched_user_id
  validates_presence_of :time_matched

  def hashify
    {
      id: self.id,
      matcher_user_id: self.matcher_user_id,
      matched_user_id: self.matched_user_id,
      time_matched: self.time_matched,
    }
  end
end
