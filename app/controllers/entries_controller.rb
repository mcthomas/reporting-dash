class EntriesController < ApplicationController
  before_action :setup_elgibilitylist

    def entry_params
        params.require(:entry).permit(:check)
    end

    def new
    end
  
    def destroy
    end
  
    private
  
    def setup_elgibilitylist
      @elgibilitylist = Elgibilitylist.new(entries: [Entry.new])
    end

    def create
        @entry = Entry.new(entry_params)
        if @entry.save
          redirect_to elgibilitylists_path
        else
          render 'new'
        end
    end

    def edit

    end



end
