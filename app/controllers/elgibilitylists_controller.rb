class ElgibilitylistsController < ApplicationController
  
    def index
      set_ui_variables
      @elgibilitylists = Elgibilitylist.all
    end
  
    def new
      @elgibilitylist = Elgibilitylist.new(entries: [Entry.new])
    end
  
    def dashboard
      @elgibilitylists = Elgibilitylist.all
    end
  
    def show
      @elgibilitylist = Elgibilitylist.find(params[:id])
    end
  
    def update
      @elgibilitylist = Elgibilitylist.find(params[:id])
      if @elgibilitylist.update(elgibilitylist_params)
        redirect_to dashboard_path
      else
        render 'edit'
      end
    end
  
    def edit
      @elgibilitylist = Elgibilitylist.find(params[:id])
    end
  
    def destroy
      @elgibilitylist = Elgibilitylist.find(params[:id])
      @elgibilitylist.destroy
      redirect_to dashboard_path
    end
  
    def create
      @elgibilitylist = Elgibilitylist.new(elgibilitylist_params)
      if @elgibilitylist.save
        redirect_to entries_path
      else
        render 'new'
      end
    end
  
    private
  
    def elgibilitylist_params
        params.require(:elgibilitylist).permit(:title, entries_attributes: [:check, :date])
    end
  
    private
  
    def set_ui_variables
      @col_classes = ['col s7 m3', 'col s5 m4', 'col s12 m5']
      card = 'card hoverable'
      @card_classes = [" #{card} red", "#{card} orange", "#{card} green", "#{card} blue",
                       "#{card} purple", "#{card} indigo", "#{card} brown"]
    end
  
  end
  