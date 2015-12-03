class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :role

  Role = Struct.new(:display_name, :value_name)

  ROLES = [
            Role.new('Super Admin', 'super_admin'),
            Role.new('Super Group Admin', 'super_group_admin'),
            Role.new('Group Admin', 'group_admin'),
            Role.new('Admin', 'admin'),
          ]
end
