class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :spaces

	def owner_of?(space_id)
		Space.exists?(user_id: self.id, id: space_id)
	end
end
