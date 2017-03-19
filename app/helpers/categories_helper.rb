module CategoriesHelper
    def all_categories
        Category.all
    end

    def cat_tree
        @@rets = Array.new
        return _reSort(all_categories)
    end




     private

     def _get_children(data,parent_id)
        data.each do |category|
        if category.parent_id == parent_id
            @@cat_destroy_arr << category.id
            _get_children(data,category.id)

                end
            end
        return @@cat_destroy_arr
     end

    def _reSort(data,parent_id = 0,level = 0)

        data.each do |category|
            if category.parent_id == parent_id
                category.level = level
                @@rets << category
                _reSort(data,category.id,level + 1)
            end
        end
    return @@rets
    end
end
