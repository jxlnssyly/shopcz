class CategoriesController < ApplicationController

    def index
    end

    def new
        @category = Category.new
    end

    def create
        # render plain: params.inspect
        @category = Category.new(carategory_params)
        @category.save
        redirect_to new_category_path

    end

    private

      def carategory_params
        params.permit(:cat_name)
      end
end

