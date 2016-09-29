class User < ActiveRecord::Base
    def self.create_user!(user_params)
        user_params[:session_token] = SecureRandom.base64
        create!(user_params)  # ActiveRecord::create!
    end
end
