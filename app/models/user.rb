class User < ActiveRecord::Base
  has_many :CtlcenconfiguracionesControllers
  enum :role => [:user, :architect, :admin]
  after_initialize :set_default_role, :if => :new_record?
  
  def set_default_role
    self.role ||= :user
  end
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
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
                       
  # Account number
  validates :account_number,
            uniqueness: true,
            presence: true,
            format: { :with => /([0-9])/, :message => 'Solo se permiten números' },
            length: { in: 8..10,
                      too_short: 'Se tienen que capturar minimo 8 caracteres',
                      too_long: 'Se tienen que capturar máximo 10 caracteres' }
end
