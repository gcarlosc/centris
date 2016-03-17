class Suscription < ActiveRecord::Base
	
	after_create :send_mail
	
	validates :fullname, presence: true
  	validates :organization, presence: true
  	validates :email, presence: true
  	validates :phone, presence: true

  	def send_mail
		SuscriptionMailer.notification_email(self).deliver
	end
end
