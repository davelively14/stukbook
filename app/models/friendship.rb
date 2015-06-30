class Friendship < ActiveRecord::Base
  belongs_to :user
  # Can't belong to :user more than once, so creates a 'friend' as a type of class 'User'. This will automatically make
  # friend_id:integer in the model be the FK.
  belongs_to :friend, class_name: 'User'

  def accept_friendship
    self.update_attributes(state: 'active', friended_at: Time.now)
  end

  def deny_friendship
    self.destroy
  end

  def cancel_friendship
    self.destroy
  end
end
