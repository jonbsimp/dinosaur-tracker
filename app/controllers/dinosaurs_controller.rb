class DinosaursController < ApplicationController
    # def index
    #     @dinosaurs = Dinosaur.all
    #     render json: @dinosaurs
    # end
    
    def index
        @dinosaurs = Dinosaur.all
        render json: @dinosaurs.to_json(:include => :sightings)
    end
    
    def create
	    @dinosaurs = Dinosaur.new(dinosaur_params)
    	if @dinosaurs.save
    		render json: @dinosaurs, status: 201
    	else
    		render json: @dinosaurs.errors, status: 422 
	    end
    end
    
    def show 
        @dinosaur = Dinosaur.find(params[:id])
        render json: @dinosaur
    end
    
    def update
        @dinosaur = Dinosaur.find(params[:id])
        @dinosaur.update!(dinosaur_params)
        render json: @dinosaur
    end
    
    def destroy
    	@dinosaur = Dinosaur.find(params[:id])
    	if @dinosaur.destroy
    		render json: @dinosaur, status: 200
    	else
    		render json: @dinosaur.errors, status: 400
    	end
    end
    
    private
    
    def dinosaur_params
        params.require(:dinosaur).permit(:name, :suborder, :order)
    end
end
