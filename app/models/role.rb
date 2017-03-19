class Role < ApplicationRecord
	validates :role_name, uniqueness:{ case_sensitive: false}



end
