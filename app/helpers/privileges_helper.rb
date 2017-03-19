module PrivilegesHelper

    def all_privileges
        Privilege.all

    end

    def find_pri_name(id_arr)
        id_arr = id_arr[1..-2].delete('"').split(',')
        name = ''
        pris = Privilege.find(id_arr)
        pris.each do |pri|
            name += pri.pri_name + ','
        end
        return name[0..-2]
    end

    def pri_tree
        @@pri_ret = Array.new
        return _priSort(Privilege.all)
    end

    private

        def _priSort(data,parent_id = 0,level = 0)
            data.each do |category|
                if category.parent_id == parent_id
                    category.level = level
                    @@pri_ret << category
                    _priSort(data,category.id,level + 1)
                end
            end
        return @@pri_ret
        end
end
