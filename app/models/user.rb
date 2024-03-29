class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable
         
  before_save :ensure_authentication_token

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :gender, :avatar, :phone

  # model
  has_many :memberships, dependent: :destroy
  has_many :groups, through: :memberships
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  def member?(group)
  	memberships.find_by_group_id(group)
  end

  def role(group)
    member?(group).current_state.name
  end

  def role_is?(group,str)
    (member?(group).current_state.name == str) rescue false
  end

  def join!(group)
  	memberships.create!(group_id: group.id)
  end

  def leave!(group)
  	memberships.find_by_group_id(group).destroy
  end
end
