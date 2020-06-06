class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets
  belongs_to :role

 

  def role?(role)
  	puts "Role::#{role}"
    self.role.title == role
   end 

  def role_admin
  	#raise self.role.inspect
    if self.role.title == 'admin'
    	puts "inside if "
    self.errors.add(:base, "Not authorized to Register")
     return false
    end
  end       

  
end
