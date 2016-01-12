class PaintingsController < ApplicationController
	def index
		@search = params[:search]

		if @search
			@paintings = Painting.search(@search)
		else
			@paintings = Painting.all
		end
		
	end

	def new
		@painting = Painting.new	
	end

	def create
		@painting = painting.new(painting_params)
		if @painting.save
			redirect_to painting_path(@painting)
		else
      		flash.now[:error] = @painting.errors.messages.first.join(" ")
      		render 'new'
      	end
	end

	def show
		@painting = Painting.find(params[:id])
	end

	def edit
		@painting = Painting.find(params[:id])	
	end

	def update
		@painting = Painting.find(params[:id])
		if @painting.update(painting_params)
			redirect_to painting_path(@painting)
		else
      		flash.now[:error] = @painting.errors.messages.first.join(" ")
      		render 'edit'
      	end
	end

	def destroy
		@painting = Painting.find(params[:id])
    	@painting.destroy
    	redirect_to paintings_path
	end

private

	def painting_params
		params.require(:painting).permit(:title,:year,:style,:image,:gallery)
	end
end
