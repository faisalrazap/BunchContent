class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :role

  Role = Struct.new(:display_name, :value_name)
  ROLES = {
    'super_admin'       => ['super_admin', 'super_group_admin', 'group_admin', 'admin'],
    'super_group_admin' => ['super_group_admin', 'group_admin', 'admin'],
    'group_admin'       => ['group_admin', 'admin'],
    'admin'             => ['admin'],
  }

  def available_roles
    ROLES[self.role].map { |role| Role.new(role.titleize, role) }
  end
end
