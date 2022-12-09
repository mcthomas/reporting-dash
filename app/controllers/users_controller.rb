class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :check_admin, :only => [:adminconsole]

    def adminconsole
        @users = User.all
        #@user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to manage_path
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          redirect_to manage_path
        else
          render 'edit'
        end
    end

    protected 
    
    def check_admin
        redirect_to dashboard_path and return unless current_user.admin?
    end

    private

    def user_params
      params.require(:user).permit(:associate, :lead, :admin)
    end

end
