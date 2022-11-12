class CatsController < ApplicationController
    def index
        @cats = Cat.all
        render :index
    end

    def show
        @cat = Cat.find(params[:id])

        if @cat
            render :show
        else
            redirect_to cats_url
        end
    end

    def create
         @cat = Cat.new(cat_params)
        if @cat.save
            redirect_to cat_url(@cat)
        else
            render :form
        end
    end

    def new
        render :form
    end

    def update
        @cat = Cat.find_by(:id, params[:id])

        if @cat.update(cat_params)
            render json: cat
        else
            render json: @cat.errors.full_messages, status: 422
        end
    end

    def edit
    end

    private
    def cat_params
        params.require(:cat).permit(:name, :birth_date, :color, :sex, :description)
    end
end