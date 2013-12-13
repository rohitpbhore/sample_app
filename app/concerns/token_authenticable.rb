module TokenAuthenticable
  extend ActiveSupport::Concern

	included do
		private :generate_authentication_token
	 
		before_save :ensure_authentication_token
	end
	 
	#ensure a token exists 
	def ensure_authentication_token
		if authentication_token.blank?
			self.authentication_token = generate_authentication_token
		end
	end
	
	#refresh the token on signup 
	def ensure_and_refresh_authentication_token
	  self.authentication_token = generate_authentication_token
	end

	def generate_authentication_token
		loop do
			token = Devise.friendly_token
			break token unless User.where(authentication_token: token).first
		end
	end
end