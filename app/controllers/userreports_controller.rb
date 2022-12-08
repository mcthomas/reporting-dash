class UserreportsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_access, :only => [:new, :edit, :destroy]
  
    def index
      set_ui_variables
      @userreports = Userreport.all
  
    end
  
    def new
      @userreport = Userreport.new
    end
  
    def dashboard
      @userreports = Userreport.all
    end
  
    def show
      @userreport = Userreport.find(params[:id])
    end
  
    def update
      @userreport = Userreport.find(params[:id])
      if @userreport.update(userreport_params)
        redirect_to dashboard_path
      else
        render 'edit'
      end
    end
  
    def edit
      @userreport = Userreport.find(params[:id])
    end
  
    def destroy
      @userreport = Userreport.find(params[:id])
      @userreport.destroy
      redirect_to dashboard_path
    end
  
    def create
      @userreport = Userreport.new(userreport_params)
      if @userreport.save
        redirect_to channelplans_path
      else
        render 'new'
      end
    end

    protected
    
    def check_access
      redirect_to dashboard_path and return unless current_user.admin?
    end
  
    private
  
    def userreport_params
      params.require(:userreport).permit(:title, :users, :usersactive, :usersinactive, :usersvalidated, :usersnotvalidated)
    end
  
    private
  
    def set_ui_variables
      @col_classes = ['col s7 m3', 'col s5 m4', 'col s12 m5']
      card = 'card hoverable'
      @card_classes = [" #{card} red", "#{card} orange", "#{card} green", "#{card} blue",
                       "#{card} purple", "#{card} indigo", "#{card} brown"]
    end
  
  end
  