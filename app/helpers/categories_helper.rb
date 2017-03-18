module CategoriesHelper
    def all_categories
        Category.all
    end

    def cat_tree
            @@ret = Array.new
        return _reSort(all_categories)
    end

    private

        def _reSort(data,parent_id = 0,level = 0)

            data.each do |category|
                if category.parent_id == parent_id
                    category.level = level
                    @@ret << category
                    _reSort(data,category.id,level + 1)
                end
            end
        return @@ret
        end

end
