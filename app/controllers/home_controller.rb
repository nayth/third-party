class HomeController < ApplicationController

	before_action :authenticate_user!

	def show
		@account = Account.first
		respond_to do |format|
			format.html
			format.js
		end

	end

	def posts
		@account = Account.first
		@recent_posts = @account.tumblr.posts(@account.name, limit: 15, notes_info: false)['posts']

		respond_to do |format|
			format.js
			format.json {render json: @recent_posts}
		end
	end
end
