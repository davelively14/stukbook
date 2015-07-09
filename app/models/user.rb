class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :username
  validates_uniqueness_of :username

  # If you only include has_many :friendships, the only relationships tracked are the friendships that the particular
  # user requested, not those that requested him/her.  The inverse_friendships identifies the relationships going in the
  # other direciton.
  has_many :friendships, dependent: :destroy
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id', dependent: :destroy

  def request_friendship(target_user)
    self.friendships.create(friend: target_user)
  end

  def pending_friend_requests_from
    self.inverse_friendships.where(state: "pending")
  end

  def pending_friend_requests_to
    self.friendships.where(state: "pending")
  end

  def active_friends
    # Use map to associate the friend objects associated with friendships.
    self.friendships.where(state: "active").map(&:friend) + self.inverse_friendships.where(state: "active").map(&:user)
  end

  def friendship_status(target_user)
    friendship = Friendship.where(user_id: [self.id,target_user.id], friend_id: [self.id,target_user.id])
    if friendship.any?
      if friendship.first.state == "active"
        return "friends"
      elsif friendship.first.user == self
        return "pending"
      else
        return "requested"
      end
    else
       "not_friends"
    end
  end

  def friendship_relation(target_user)
    Friendship.where(user_id: [self.id,target_user.id], friend_id: [self.id,target_user.id]).first
  end
end
