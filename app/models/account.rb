class Account < ActiveRecord::Base

	belongs_to :user

	def self.find_or_create_from_auth_hash(auth_hash)
		account = where(provider: auth_hash[:provider], uid: auth_hash[:uid]).first_or_create
		account.update(
			name: auth_hash.info.blogs[0].name,
			token: auth_hash.credentials.token,
			secret: auth_hash.credentials.secret,
			url: auth_hash.info.blogs[0].url
		)
		account
	end

	def tumblr
		Tumblr.configure do |config|
				config.consumer_key = "cmd2sNVo9R0cJG6yhx72bkYZH0kuy253GFDBey4dTAjbORgb9U"
				config.consumer_secret = "drTYb2Pdrk7iKWSa7oH1m7usIw6F3QyEVMajmRv50vLlnK2A1t"
				config.oauth_token_secret = secret
				config.oauth_token = token
		end

		client = Tumblr::Client.new
	end

end
