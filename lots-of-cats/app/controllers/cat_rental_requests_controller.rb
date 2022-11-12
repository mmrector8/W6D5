class CatRentalRequestsController < ApplicationController


    def new
        @rental_requests = CatRentalRequest.new
        render :form
    end

    def create
        @rental_requests = CatRentalRequest.new(cat_rental_requests_params)

        if @rental_requests.save
            redirect_to cat_rental_request_url
        else
            render :form
        end
    end

    private
    def cat_rental_requests_params
        params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
    end


end