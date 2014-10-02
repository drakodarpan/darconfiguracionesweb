class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:account_number]
  
  def email_required?
    false
  end
  
  def email_changed?
    false
  end
  
  # Avatar
  has_attached_file :avatar,
  :styles => { :medium => "300x300>", :thumb => "100x100>" },
  :default_url => 'missing.jpg'
  
  validates_attachment :avatar,
  :size => { :in => 0..20.kilobytes },
  :content_type => { :content_type => /\Aimage\/.*\Z/ }
end
