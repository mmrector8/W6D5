class CatsController < ApplicationController
    def index
        cats = Cat.all
        render json: cats
    end

    def show
        cat = Cat.find(params[:id])
        render json: cat
    end

    def create
        new_cat = Cats.new(cat_params)
        if new_cat.save!
            render json: new_cat
        else
            render json: new_cat.errors.full_messages, status: 422
        end
    end

    def update
        cat_to_edit = Cat.find_by(:id, params[:id])

        if cat_to_edit.update(cat_params)
            render json: cat_to_edit
        else
            render json: cat_to_edit.errors.full_messages, status: 422
        end
    end

    private
    def cat_params
        params.require(:cats).permit(:name, :birth_date, :color, :sex, :description)
    end
end