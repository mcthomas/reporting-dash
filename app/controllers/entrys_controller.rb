class EntrysController < ApplicationController

    def elgibilitylist_params
        params.require(:elgibilitylist).permit(:title, entrys_attributes: [:check, :date])
    end

end
