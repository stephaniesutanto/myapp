class BucketlistsController < ApplicationController
	before_action :find_bucketlist, only: [:show, :edit, :update, :destroy]
	def index
		@bucketlists = Bucketlist.all.order("created_at DESC")
	end
	
	def show
	end
	
	def new
		@bucketlist = Bucketlist.new
	end
	
	def create
		@bucketlist = Bucketlist.new(bucketlists_params)
		if @bucketlist.save
			redirect_to @bucketlist
		else
			render "New"
		end
	end

	def edit

	end

	def update
		if @bucketlist.update(bucketlists_params)
			redirect_to @bucketlist
		else
			render "Edit"
		end
	end

	def destroy
		@bucketlist.destroy
		redirect_to root_path
	end

	private

	def bucketlists_params
		params.require(:bucketlist).permit(:title, :description, :url)
	end

	def find_bucketlist
		@bucketlist = Bucketlist.find(params[:id])
	end
end
