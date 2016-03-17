class Suscription < ActiveRecord::Base
	
	validates :fullname, presence: true
  	validates :organization, presence: true
  	validates :email, presence: true
  	validates :phone, presence: true
  	
end
