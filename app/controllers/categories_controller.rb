class CategoriesController < ApplicationController

    def index
        @categories = cat_tree
        # render plain: @categories.inspect
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(carategory_params)
        @category.save
        redirect_to categories_path
    end

    def edit
        @category = Category.find(params[:id])
    end
    def destroy
        @category = Category.find(params[:id])
        @category.destroy
        redirect_to categories_path
    end

    private

      def carategory_params
        params.permit(:cat_name,:parent_id)

      end
end

