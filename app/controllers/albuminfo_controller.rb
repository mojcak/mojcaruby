class AlbuminfoController < ApplicationController
	def index
		@info = Albuminfo.paginate(page: params[:page], :per_page => 10)
	end
end