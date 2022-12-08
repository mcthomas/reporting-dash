class EligibilitylistsController < ApplicationController
  
    def index
      set_ui_variables
      @eligibilitylists = Eligibilitylist.all
  
    end
  
    def new
      @eligibilitylist = Eligibilitylist.new
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
        redirect_to channelplans_path
      else
        render 'new'
      end
    end

    def import
      file = params[:file]
      return redirect_to elgibilitylists_path, notice: 'File format must be .csv' unless file.content_type == 'text/csv'
      CsvImportEligibilitylistsService.new.call(file)
      redirect_to dashboard_path, notice: 'Elgibility List(s) imported!'
    end
  
    private
  
    def userreport_params
      params.require(:eligibilitylist).permit(:title, :q1, :q2, :q3, :q4, :q5, :q6, :q7, :q8, :q9, :q10, :a1, :a2, :a3, :a4, :a5, :a6, :a7, :a8, :a9, :a10)
    end
  
    private
  
    def set_ui_variables
      @col_classes = ['col s7 m3', 'col s5 m4', 'col s12 m5']
      card = 'card hoverable'
      @card_classes = [" #{card} red", "#{card} orange", "#{card} green", "#{card} blue",
                       "#{card} purple", "#{card} indigo", "#{card} brown"]
    end
  
  end
  