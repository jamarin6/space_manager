class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :spaces

	scope :ordered_by_email, -> { order(:email) }


	def owner_of?(space_id)
		Space.exists?(user_id: self.id, id: space_id)
	end

	def self.ordered_by_email
		all.sort_by(&:email)
	end
end
