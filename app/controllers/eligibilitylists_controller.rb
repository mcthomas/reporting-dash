class EligibilitylistsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin, :only => [:new, :destroy, :import]
  before_action :check_lead, :only => [:edit]
  
    def index
      set_ui_variables
      @eligibilitylists = Eligibilitylist.all
  
    end
  
    def new
      @eligibilitylist = Eligibilitylist.new
      @user = current_user.email
    end
  
    def dashboard
      @eligibilitylists = Eligibilitylist.all
    end
  
    def show
      @eligibilitylist = Eligibilitylist.find(params[:id])
    end
  
    def update
      @eligibilitylist = Eligibilitylist.find(params[:id])
      if @eligibilitylist.update(userreport_params)
        redirect_to dashboard_path
      else
        render 'edit'
      end
    end
  
    def edit
      @eligibilitylist = Eligibilitylist.find(params[:id])
    end
  
    def destroy
      @eligibilitylist = Eligibilitylist.find(params[:id])
      @eligibilitylist.destroy
      redirect_to dashboard_path
    end
  
    def create
      @eligibilitylist = Eligibilitylist.new(userreport_params)
      if @eligibilitylist.save
        redirect_to root_path
      else
        render 'new'
      end
    end

    def import
      file = params[:file]
      if file
        return redirect_to dashboard_path_path, notice: 'File format must be .csv' unless file.content_type == 'text/csv'
        CsvImportEligibilitylistsService.new.call(file)
        redirect_to dashboard_path, notice: 'Elgibility List(s) imported!'
      end
    end

    protected

    def check_admin
      redirect_to dashboard_path and return unless current_user.admin?
    end

    def check_lead
      redirect_to dashboard_path and return unless (current_user.admin? or current_user.lead?)
    end
  
    private
  
    def userreport_params
      params.require(:eligibilitylist).permit(:title, :q1, :q2, :q3, :q4, :q5, :q6, :q7, :q8, :q9, :q10, :a1, :a2, :a3, :a4, :a5, :a6, :a7, :a8, :a9, :a10, :assign)
    end
  
    private
  
    def set_ui_variables
      @col_classes = ['col s7 m3', 'col s5 m4', 'col s12 m5']
      card = 'card hoverable'
      @card_classes = [" #{card} red", "#{card} orange", "#{card} green", "#{card} blue",
                       "#{card} purple", "#{card} indigo", "#{card} brown"]
    end
  
  end
  