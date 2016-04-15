class CarsController < ApplicationController
	before_action :find_car, only: [:show, :edit, :update, :destroy,]
	before_action :authenticate_user!, only: [:new, :edit]

	def index
		if params[:category].blank?
			@cars = Car.all.order("created_at DESC")
		else
			@category_id = Category.find_by(name: params[:category]).id
			@cars = Car.where(:category_id => @category_id).order("created_at DESC")
		end
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
		@categories = Category.all.map{ |c| [c.name, c.id ]}
	end

	def update
		   @car.category_id = params[:category_id]
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
			params.require(:car).permit(:name, :description, :category_id, :car_img)
		end

		def find_car
			@car = Car.find(params[:id])
		end
end
