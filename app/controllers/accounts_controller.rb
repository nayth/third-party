class AccountsController < ApplicationController
	def create
		@account = Account.find_or_create_from_auth_hash(auth_hash)
		redirect_to root_url
	end

	protected

		def auth_hash
			request.env['omniauth.auth']
		end
end
