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
end
