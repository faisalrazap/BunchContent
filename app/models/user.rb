class User < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :creator, class_name: 'User'

  validates_presence_of :role

  Role = Struct.new(:role_name, :role_value)
  ROLES = {
    super_admin:        ['super_admin', 'super_group_admin', 'group_admin', 'admin'],
    super_group_admin:  ['super_group_admin', 'group_admin', 'admin'],
    group_admin:        ['group_admin', 'admin'],
    admin:              ['admin'],
  }

  def sub_roles
    ROLES[self.role.to_sym].map { |role| Role.new(role.titleize, role) }
  end

  def sub_users
    super_admin? ? User.all : User.where(creator_id: id)
  end

  def super_admin?
    role == 'super_admin'
  end

  def admin?
    role == 'admin'
  end

  def validate(user)
    return { url: users_path, message: 'User does not exist' } if user.blank?
    return { url: root_url, message: 'You are not Authorized to do this action' } unless super_admin? || user.creator == self
  end

  def inactive?
    not active
  end
end
