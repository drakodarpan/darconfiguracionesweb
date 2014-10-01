class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  def email_required?
    false
  end
  
  def email_changed?
    false
  end
  
end
