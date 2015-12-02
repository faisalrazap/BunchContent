class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :role

  role = Struct.new(:display_name, :value_name)
  ROLES = [role.new('Super Admin', 'superadmin'), role.new('Super Group Admin', 'supergroupadmin'), role.new('Group Admin', 'groupadmin'), role.new('Admin', 'admin')]
end
