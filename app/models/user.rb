class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :chirps
  has_one_attached :avatar
    serialize :following, Array

  validates :username, presence: true
  validates :username, uniqueness: true

  def avatar_thumbnail
  	if avatar.attached?
  		avatar.variant(resize: "25x25!").processed
  	else
  		'/default_avatar.png'
  end

  private

  	def add_default_avatar
  		unless avatar.attached?
  			avatar.attach(
  				io: File.open(
  					Rails.root.join(
  						'app','assets', 'images', 'default_avatar.png'
  						)
  					), filename: 'default_avatar.png',
  				content_type: 'image/png'
  				)
  			
  		end
  	end
  end

end
