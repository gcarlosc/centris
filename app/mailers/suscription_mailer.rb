class SuscriptionMailer < ApplicationMailer

	def notification_email(suscriptor)
    	@user = suscriptor
   	 	@url  = 'http://example.com/login'
    	mail to: suscriptor.email, subject: 'Suscription wecentris'
  	end
end