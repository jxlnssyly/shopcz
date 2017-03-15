class Admin < ApplicationRecord

    validates :username, presence: true, uniqueness: true

    validates :password, presence: true

    before_save { self.password = Digest::MD5::hexdigest(self.password) }

    def login
        @password = self.password
        @info = Admin.find_by(username: self.username.to_s)
        if @info
            if @info.password == Digest::MD5::hexdigest(self.password)

                return true
            else
                return 2;
            end
        else
            return 1;
        end
    end

end
