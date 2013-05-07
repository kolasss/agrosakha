class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :recoverable
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  
  has_many :sells, :dependent => :destroy
  has_many :buys, :dependent => :destroy
  has_one :profile, :dependent => :destroy

  after_create :default_role

  self.per_page = 25

  private
    def default_role
      self.roles << Role.where(:name => 'guest').first
    end
end
