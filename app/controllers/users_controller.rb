class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :check_admin, :only => [:manage]

    def manage
        
    end

    protected 
    
    def check_admin
        redirect_to dashboard_path and return unless current_user.admin?
    end

end
