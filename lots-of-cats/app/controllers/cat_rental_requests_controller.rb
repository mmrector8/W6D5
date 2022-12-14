class CatRentalRequestsController < ApplicationController

    def index
        @requests = CatRentalRequest.all 
        render json: @requests
    end

    def new
        @rental_request = CatRentalRequest.new
        render :form
    end

    def create
        @rental_request = CatRentalRequest.new(cat_rental_requests_params)

        if @rental_request.save
           redirect_to cat_url(@rental_request.cat)
        else
            render :form
        end
    end

    private
    def cat_rental_requests_params
        params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
    end


end