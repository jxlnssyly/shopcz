class Privilege < ApplicationRecord
    after_destroy :delete_children

    def delete_children
        @@pri_destroy_arr = Array.new
        get_children(self.id)
        @@pri_destroy_arr.each do |c|
           cat = Category.find_by(id: c)
           if cat.nil? == false
                cat.destroy
           end
        end
     end

     def get_children(cat_id)

        data = Category.all
        return _get_children(data,cat_id)
     end

    private
     def _get_children(data,parent_id)
        data.each do |category|
            if category.parent_id == parent_id
                @@pri_destroy_arr << category.id
                _get_children(data,category.id)
            end
        end
        return @@pri_destroy_arr
     end
end
