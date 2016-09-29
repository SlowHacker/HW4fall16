class SessionsController < ApplicationController
    
    def user_params
        params.require(:user).permit(:user_id, :email)
    end
    
    def new
    end
    
    def create
        @user = User.where(user_id: user_params[:user_id], email: user_params[:email])
        if @user.present?
            session[:session_token] = @user.first.session_token
            flash[:notice] = "You are logged in as #{@user.first.user_id}"
            redirect_to movies_path
        else
            flash[:notice] = "Invalid user-id/e-mail combination. Please try again."
            redirect_to login_path
        end
    end
    
    def destroy
        reset_session
        redirect_to movies_path
    end
end