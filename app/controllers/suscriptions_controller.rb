class SuscriptionsController < ApplicationController
	def new
		@suscription = Suscription.new	
	end

	def create
		@suscription = Suscription.new(suscription_params)
   	 	@suscription.save
	end

	def suscription_params
    	params.require(:suscription).permit(:fullname, :organization , :email, :phone, :comment)
  	end
end
