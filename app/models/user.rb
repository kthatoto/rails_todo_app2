class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  has_many :assignments, dependent: :destroy
  has_many :tasks, through: :assignments,

  def email_required?
    false
  end
  def will_save_change_to_email?
    false
  end
end
