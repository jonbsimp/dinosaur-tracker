class SightingsController < ApplicationController
    
    # def index
    #     @sightings = Sighting.where(date: params[:start_date]..params[:end_date])
    #     render json: @sightings
    # end
    
    def index
        @sightings = Sighting.all
        render json: @sightings
    end
    
     def show
        @dinosaurs = Dinosaur.find(params[:id])
        render json: @animals.to_json(:include => :sightings)
    end
    
    def create
	    @sightings = Sighting.new(sighting_params)
    	if @sightings.save
    		render json: @sightings, status: 201
    	else
    		render json: @sightings.errors, status: 422 
	    end
    end
    
    def update
        @sighting = Sighting.find(params[:id])
        @sighting.update!(sighting_params)
        render json: @sighting
    end
    
    def destroy
    	@sighting = Sighting.find(params[:id])
    	if @sighting.destroy
    		render json: @sighting, status: 200
    	else
    		render json: @sighting.errors, status: 400
    	end
    end
    
    private
    
    def sighting_params
        params.require(:sighting).permit(:dinosaur_id, :date, :latitude, :longitude, :start_date, :end_date)
    end
end
