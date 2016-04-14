class CarsController < ApplicationController
	before_action :find_car, only: [:show, :edit, :update, :destroy]

	def index
		@cars = Car.all.order("created_at DESC")
	end

	def show
	end

	def new
		@car = current_user.cars.build
		@categories = Category.all.map{ |c| [c.name, c.id ]}
	end

	def create
		@car = current_user.cars.build(car_params)
		@car.category_id = params[:category_id]

		if @car.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @car.update(car_params)
			redirect_to car_path(@car)
		else
			render 'new'
	end
end

	def destroy
		@car.destroy
		redirect_to root_path
	end


	private

		def car_params
			params.require(:car).permit(:name, :description, :category_id)
		end

		def find_car
			@car = Car.find(params[:id])
		end
end
