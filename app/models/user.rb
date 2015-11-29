class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :role

  ROLES = [['Super Admin', 'superadmin'], ['Super Group Admin', 'supergroupadmin'], ['Group Admin', 'groupadmin'], ['Admin', 'admin']]
end
